//
//  ViewController.swift
//  UIView
//
//  Created by Артём on 05.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView = UIScrollView()
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        scrollView = UIScrollView()
        addScrollView()
        
        let greetingLabel = UILabel()
        setOnCenter(label: greetingLabel, withText: "Hello, swipe down!", withTopoffset: 20)
        
        let goodbyeLabel = UILabel()
        setOnCenter(label: goodbyeLabel, withText: "Goodbye", withTopoffset: 1000)
        goodbyeLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true;
        
        addText()
    }
    
    func addScrollView(){
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor).isActive = true;
        scrollView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor).isActive = true;
        scrollView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor).isActive = true;
        scrollView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor).isActive = true;
        
        scrollView.backgroundColor = .blue
    }
    
    func setOnCenter(label : UILabel, withText text : String, withTopoffset topOffset : Int){
        label.text = text
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        label.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat(topOffset)).isActive = true
    }

    
    func addText(){
        scrollView.addSubview(textView)
    }
}

