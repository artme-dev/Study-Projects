//
//  AlertVC.swift
//  URLSession
//
//  Created by Артём on 29.07.2021.
//

import UIKit

class AlertVC: UIAlertController {
    
    var progressView = UIProgressView(progressViewStyle: .bar)
    var indicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.heightAnchor.constraint(equalToConstant: 170).isActive = true
        
        view.addSubview(indicatorView)
        view.addSubview(progressView)
        
        addIndicatorConstraints()
        addProgressViewConstraints()
        
        setActivityProgress(to: 0)
    }

    func addCancelAction(completion: @escaping ()->()){
        let action = UIAlertAction(title: "Cancel", style: .destructive) { action in
            completion()
        }
        addAction(action)
    }
    
    func addIndicatorConstraints(){
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 5).isActive = true
    }
    
    func addProgressViewConstraints(){
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44).isActive = true
    }
    
    func setActivityProgress(to value: Float){
        message = "\(Int(value * 100))%"
        progressView.setProgress(value, animated: true)
    }
}
