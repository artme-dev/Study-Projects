//
//  MenuTableVC.swift
//  URLSession
//
//  Created by Артём on 25.07.2021.
//

import UIKit

private let reuseIdentifier = "menuOptionCell"

class MenuTableVC: UITableViewController {
    
    private let provider = BigDataProvider()
    private let menuOptions: [MenuOption] = MenuOption.allCases

    lazy var downloadingAlert: AlertVC = {
        let alertVC = AlertVC(title: "Downloading...",
                              message: nil,
                              preferredStyle: .alert)
        
        alertVC.addCancelAction {
            self.provider.cancelDownloading()
        }
        return alertVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Menu"
        
        NotificationUtil.requestAuthorization()
        
        tableView.register(MenuTableCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let cell = reusableCell as? MenuTableCell ?? MenuTableCell()
        
        cell.menuOptionTitle = menuOptions[indexPath.row].rawValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let option = menuOptions[indexPath.row]
        
        switch option {
        case .imageDownloader: imageDownloader()
        case .getRequest: getRequest()
        case .postRequest: postRequest()
        case .coursesFetcher: coursesFetcher()
        case .imageUploader: uploadImage()
        case .fileDownloader: downloadFile()
        }
        
        func imageDownloader(from url: String? = nil){
            let viewController = UIViewController()
            let imageView = BigImageView()
            imageView.imageURL = url
            
            viewController.view.addSubview(imageView)
            imageView.frame = viewController.view.bounds
            imageView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
            
            viewController.title = "Image"
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        func getRequest(){
            AlamofireNetworkService.GETRequest { _ in }
        }
        
        func postRequest(){
            AlamofireNetworkService.POSTRequest { response in
                print("Response to POST Request: \(response.statusCode)")
                print(response.allHeaderFields)
            }
        }
        
        func coursesFetcher(){
            let coursesTableVC = CoursesTableVC()            
            coursesTableVC.title = "Courses"
            navigationController?.pushViewController(coursesTableVC, animated: true)

        }
        
        func uploadImage(){
            AlamofireNetworkService.uploadImage{
                uploadedImageUrl in
                print("Uploaded image url: \(uploadedImageUrl)")
                DispatchQueue.main.async {
                    imageDownloader(from: uploadedImageUrl)
                }
            }
        }
        
        func downloadFile(){
            if provider.onProgress == nil{
                provider.onProgress = {
                    currentProgress in
                    DispatchQueue.main.async {
                        self.downloadingAlert .setActivityProgress(to: Float(currentProgress))
                    }
                }
            }
            if provider.onComplete == nil{
                provider.onComplete = {
                    location in
                    DispatchQueue.main.async {
                        self.downloadingAlert.dismiss(animated: false, completion: nil)
                        NotificationUtil.pushNotification(with: "Your file is ready!")
                    }
                }
            }
            provider.startDownloading(from: URLConstants.file)
            
            present(downloadingAlert, animated: true)
        }
    }
}
