//
//  ViewController.swift
//  Total Recall
//
//  Created by Артём on 14.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var optionsCountField = UITextField()
    var mainButton = UIButton()
    var optionsCountStepper = UIStepper()
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .orange
    
        view.addSubview(optionsCountField)
        view.addSubview(mainButton)
        view.addSubview(optionsCountStepper)
        view.addSubview(label)
        
        configureOptionsCountField()
        configureMainButton()
        configureCountStepper()
        configureLable()
    }
    
    func configureOptionsCountField() {
        optionsCountField.placeholder = "Options count"
        optionsCountField.backgroundColor = .white
        optionsCountField.layer.cornerRadius = 5
        optionsCountField.translatesAutoresizingMaskIntoConstraints = false
        optionsCountField.isEnabled = false
        optionsCountField.textAlignment = .center

        optionsCountField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        optionsCountField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20).isActive = true
        optionsCountField.trailingAnchor.constraint(equalTo: optionsCountStepper.leadingAnchor, constant: -20).isActive = true
        optionsCountField.heightAnchor.constraint(equalTo: mainButton.heightAnchor, multiplier: 1).isActive = true
        optionsCountField.text = "1"
    }
    
    func configureMainButton() {
        mainButton.setTitle("Get random value", for: .normal)
        mainButton.setTitleColor(.purple, for: .normal)
        mainButton.setTitleColor(.orange, for: .highlighted)
        mainButton.layer.cornerRadius = 5
        mainButton.backgroundColor = .white
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        mainButton.addTarget(self, action: #selector(mainButtonIsPressed), for: .touchUpInside)
    
        mainButton.topAnchor.constraint(equalTo: optionsCountField.bottomAnchor, constant: 20).isActive = true
        mainButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20).isActive = true
        mainButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func configureCountStepper() {
        optionsCountStepper.stepValue = 1
        optionsCountStepper.minimumValue = 1
        optionsCountStepper.translatesAutoresizingMaskIntoConstraints = false
        optionsCountStepper.backgroundColor = .white
        optionsCountStepper.layer.cornerRadius = 10
        optionsCountStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        
        optionsCountStepper.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        optionsCountStepper.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20).isActive = true
        optionsCountStepper.heightAnchor.constraint(equalTo: mainButton.heightAnchor, multiplier: 1).isActive = true
    }
    
    func configureLable(){
        label.textAlignment = .center
        label.text = "Your random value"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: "GillSans", size: 38)
        label.textColor = .white
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: optionsCountField.topAnchor, constant: -40).isActive = true
    }
    
    @objc func stepperValueChanged(){
        optionsCountField.text = String(Int(optionsCountStepper.value))
    }
    
    @objc func mainButtonIsPressed(){
        let maxRandomValue = optionsCountStepper.value
        label.text = String(getPositiveRandomValue(max: Int(maxRandomValue)))
    }
    
    func getPositiveRandomValue(max: Int) -> Int{
        return Int.random(in: 1...max)
    }
}
