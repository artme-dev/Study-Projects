//
//  WebDescriptionVC.swift
//  URLSession
//
//  Created by Артём on 27.07.2021.
//

import WebKit
import UIKit

class WebDescriptionVC: UIViewController {
    
    let webView = WKWebView()
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        guard let url = url else { return }
        loadDescription(url: url)
    }
    
    override func viewWillLayoutSubviews() {
        webView.frame = view.bounds
    }
    
    func loadDescription(url: String){
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
