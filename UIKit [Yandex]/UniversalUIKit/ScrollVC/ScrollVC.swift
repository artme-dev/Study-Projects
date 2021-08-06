//
//  ScrollVC.swift
//  UniversalUIKit
//
//  Created by Артём on 16.07.2021.
//

import UIKit

class ScrollVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let textLabel: UILabel = {
        let label = UILabel()
        let infinityArr = Array(repeating: "Hello, world!", count: 300)
        label.text = infinityArr.joined(separator: " ")
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let agreementButton: UIButton = {
        let button = UIButton()
        button.setTitle("Agree", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configureScroll(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewLayout = view.layoutMarginsGuide
        scrollView.leadingAnchor.constraint(equalTo: viewLayout.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: viewLayout.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: viewLayout.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: viewLayout.bottomAnchor).isActive = true
        
        scrollView.addSubview(agreementButton)
        scrollView.addSubview(textLabel)
    }
    
    func configureItems(){
        textLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        textLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        agreementButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        agreementButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5).isActive = true
        agreementButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20).isActive = true
        agreementButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureScroll()
        configureItems()
    }
}
