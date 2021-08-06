//
//  BigDataProvider.swift
//  URLSession
//
//  Created by Артём on 27.07.2021.
//

import Foundation
import UIKit

class BigDataProvider: NSObject{
    
    var bgTask: URLSessionDownloadTask!
    var onProgress: ((Double)->())?
    var onComplete: ((String)->())?
    
    lazy var bgSession: URLSession = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "ru.nsu.artem")
//        configuration.isDiscretionary = true
        configuration.sessionSendsLaunchEvents = true
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        return session
    }()
    
    func startDownloading(from url: String){
        guard let url = URL(string: url) else { return }
        bgTask = bgSession.downloadTask(with: url)
        bgTask.earliestBeginDate = Date()
        bgTask.countOfBytesClientExpectsToSend = 512
        bgTask.countOfBytesClientExpectsToReceive = 100 * 1024 * 1024
        bgTask.resume()
    }
    func cancelDownloading(){
        bgTask.cancel()
    }
}

extension BigDataProvider: URLSessionDelegate{
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        
        DispatchQueue.main.async {
            guard
                let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                let completion = appDelegate.backgroundTaskCompletion
            else{
                return
            }
            
            appDelegate.backgroundTaskCompletion = nil
            completion()
        }
    }
}


extension BigDataProvider: URLSessionDownloadDelegate{
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        self.onComplete?(location.absoluteString)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else { return }
        let currentProgress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
        
        self.onProgress?(currentProgress)
    }
}
