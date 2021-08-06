//
//  ViewController.swift
//  SimpleWeb
//
//  Created by Артём on 19.06.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webNavBar = UIStackView()
    let backButton = UIButton()
    let forwardButton = UIButton()
    let urlField = UITextField()

    let web = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webNavBar)
        
        webNavBar.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        webNavBar.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        webNavBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        
        webNavBar.axis = .horizontal
        webNavBar.spacing = 5
        webNavBar.distribution = .fillProportionally
        webNavBar.alignment = .fill
        webNavBar.translatesAutoresizingMaskIntoConstraints = false
        
        webNavBar.addArrangedSubview(backButton)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalTo: webNavBar.heightAnchor).isActive = true
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        webNavBar.addArrangedSubview(urlField)
        urlField.delegate = self
        urlField.placeholder = "URL"
        urlField.borderStyle = UITextField.BorderStyle.roundedRect
        urlField.autocorrectionType = UITextAutocorrectionType.no
        urlField.keyboardType = UIKeyboardType.URL
        urlField.translatesAutoresizingMaskIntoConstraints = false
        urlField.heightAnchor.constraint(equalTo: webNavBar.heightAnchor).isActive = true
        
        webNavBar.addArrangedSubview(forwardButton)
        forwardButton.setTitle("Forward", for: .normal)
        forwardButton.setTitleColor(.black, for: .normal)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.heightAnchor.constraint(equalTo: webNavBar.heightAnchor).isActive = true
        forwardButton.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        
        forwardButton.widthAnchor.constraint(equalTo: backButton.widthAnchor).isActive = true
        urlField.widthAnchor.constraint(equalTo: backButton.widthAnchor, multiplier: 2.5).isActive = true
        
        view.addSubview(web)
        let url = URL(string: "https://apple.com")
        web.load(URLRequest(url: url!))
        web.translatesAutoresizingMaskIntoConstraints = false
        web.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        web.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        web.topAnchor.constraint(equalTo: webNavBar.bottomAnchor, constant:10).isActive = true
        web.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        web.navigationDelegate = self
    }
    
    @objc func goBack(){
        if(web.canGoBack){
            web.goBack()
        }
    }
    
    @objc func goForward(){
        if(web.canGoForward){
            web.goForward()
        }
    }
}


extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let inputData = textField.text
        let userUrl = URL(string: inputData!)
        web.load(URLRequest(url: userUrl!))
        
        view.endEditing(true)
        return true
    }
}

extension ViewController: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        urlField.text = webView.url?.absoluteString
    }
}

