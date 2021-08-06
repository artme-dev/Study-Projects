//
//  ViewController.swift
//  UIKit (code)
//
//  Created by Артём on 28.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var labelWithNumber = UILabel()
    var actionButtons = [UIButton]()
    
    var clearButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemGray3
        
        labelWithNumber.text = "Number"
        labelWithNumber.backgroundColor = .cyan
        labelWithNumber.font.withSize(14)
        labelWithNumber.translatesAutoresizingMaskIntoConstraints = false
        labelWithNumber.isHidden = true
        view.addSubview(labelWithNumber)
        
        clearButton = createButton(withColor: .red, withTitle: "Clear")
        clearButton.isHidden = true
        clearButton.frame.size = CGSize(width: 20.0, height: 10.0)
        view.addSubview(clearButton)
        clearButton.addTarget(self, action: #selector(clearMessage(_:)), for: .touchUpInside)
        
        let goodbyeButton = createButton(withColor: .purple, withTitle: "Goodbye")
        actionButtons.append(goodbyeButton)
        goodbyeButton.tag = 2
        goodbyeButton.addTarget(self, action: #selector(ViewController.showMessage), for: .touchUpInside)
        
        let greetingButton = createButton(withColor: .orange, withTitle: "Greeting")
        actionButtons.append(greetingButton)
        greetingButton.tag = 1
        greetingButton.addTarget(self, action: #selector(ViewController.showMessage), for: .touchUpInside)
        
        for button in actionButtons{
            view.addSubview(button)
        }
        
        let numberX = labelWithNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let numberY = labelWithNumber.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        numberY.priority = UILayoutPriority(500)
        
        let numberTop = labelWithNumber.topAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.topAnchor, constant: 50)
        let greetingTop = greetingButton.topAnchor.constraint(greaterThanOrEqualTo: labelWithNumber.bottomAnchor, constant: 50)
        greetingTop.priority = UILayoutPriority(600)
        
        let numberHeight = labelWithNumber.heightAnchor.constraint(equalTo: clearButton.heightAnchor, multiplier: 1)
        numberHeight.priority = UILayoutPriority(900)
        
        let greetingHeight = greetingButton.heightAnchor.constraint(equalTo: clearButton.heightAnchor, multiplier: 1)
        let greetingWidth = greetingButton.widthAnchor.constraint(equalTo: clearButton.widthAnchor, multiplier: 1)
        let greetingX = greetingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let greetingBottom = greetingButton.bottomAnchor.constraint(equalTo: goodbyeButton.topAnchor, constant: -20)
        
        let goodbyeHeight = goodbyeButton.heightAnchor.constraint(equalTo: clearButton.heightAnchor, multiplier: 1)
        let goodbyeWidth = goodbyeButton.widthAnchor.constraint(equalTo: clearButton.widthAnchor, multiplier: 1)
        let goodbyeX = goodbyeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let goodbyeBottom = goodbyeButton.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: -20)
        
        let clearX = clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let clearBottom = clearButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        let clearHeight = clearButton.heightAnchor.constraint(equalToConstant: 50)
        let clearWidth = clearButton.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([
            greetingHeight, greetingWidth, greetingX, greetingBottom, greetingTop,
            goodbyeHeight, goodbyeWidth, goodbyeX, goodbyeBottom,
            clearX, clearBottom, clearHeight, clearWidth,
            numberX, numberY, numberTop,numberHeight
        ])
    }
    
    func createButton(withColor color : UIColor, withTitle title: String) -> UIButton{
        let button =  UIButton()
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }
    
    @objc func showMessage(_ sender: UIButton) {
        if sender.tag == 1 {
            labelWithNumber.text = "Hello!"
        } else {
            labelWithNumber.text = "Good luck!"
        }
        
        labelWithNumber.isHidden = false
        clearButton.isHidden = false
        
        for button in actionButtons{
            button.isHidden = true
        }
    }
    
    @objc func clearMessage(_ sender: UIButton) {
            labelWithNumber.isHidden = true
            clearButton.isHidden = true
    
            for button in actionButtons{
                button.isHidden = false
            }
        }
}
