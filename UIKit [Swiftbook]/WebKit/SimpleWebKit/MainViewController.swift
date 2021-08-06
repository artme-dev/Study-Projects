//
//  ViewController.swift
//  WebKit
//
//  Created by Артём on 19.06.2021.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
    
    let webNavBar = UIStackView()
    let backButton = UIButton()
    let forwardButton = UIButton()
    let urlField = UITextField()
    
    let

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webNavBar)
        
        webNavBar.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        webNavBar.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        webNavBar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        
        webNavBar.axis = .horizontal
        webNavBar.spacing = 5
        webNavBar.distribution = .fillProportionally
        webNavBar.alignment = .fill
        webNavBar.translatesAutoresizingMaskIntoConstraints = false
        
        webNavBar.addArrangedSubview(backButton)
        backButton.setTitle("Back", for: .normal)
        backButton.isEnabled = false
        backButton.setTitleColor(.black, for: .normal)
        backButton.setTitleColor(.gray, for: .disabled)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.heightAnchor.constraint(equalTo: webNavBar.heightAnchor).isActive = true

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
        forwardButton.isEnabled = false
        forwardButton.setTitleColor(.black, for: .normal)
        forwardButton.setTitleColor(.gray, for: .disabled)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.heightAnchor.constraint(equalTo: webNavBar.heightAnchor).isActive = true
        
        forwardButton.widthAnchor.constraint(equalTo: backButton.widthAnchor).isActive = true
        urlField.widthAnchor.constraint(equalTo: backButton.widthAnchor, multiplier: 2.5).isActive = true
        
        
    }
}


extension MainViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
