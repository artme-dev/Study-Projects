//
//  ViewController.swift
//  UIControllers
//
//  Created by Артём on 01.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderSegments: UISegmentedControl!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var birthdayDatePicker: UIDatePicker!
    
    @IBOutlet weak var dayCountLabel: UILabel!
    @IBOutlet weak var dayStepper: UIStepper!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingSlider: UISlider!
    
    @IBOutlet weak var apartTypeLabel: UILabel!
    var apartTypePicker: UIPickerView!
    @IBOutlet weak var UIPickerField: UITextField!
    let apartTypes = ["Flat", "TownHouse", "Cottage", "Tent"]
    
    @IBOutlet weak var functionLabel: UILabel!
    @IBOutlet weak var functionSwitch: UISwitch!
    
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainButton.setTitle("Search", for: .normal)
        
        setUISegmentedControl()
        setUISlider()
        setUIField()
        setUIDatePicker()
        setUISwitch()
        setUIPicker()
        setUIStepper()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(stopEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func setUISegmentedControl(){
        genderLabel.text = "Gender"
        genderSegments.setTitle("Male", forSegmentAt: 0)
        genderSegments.setTitle("Female", forSegmentAt: 1)
        genderSegments.insertSegment(withTitle: "Other", at: 2, animated: true)
        genderSegments.addTarget(self, action: #selector(handleSegmentSetting(sender:)), for: .valueChanged)
        genderSegments.selectedSegmentTintColor = .orange
    }
    
    @objc func handleSegmentSetting(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            genderLabel.text = "Male"
        case 1:
            genderLabel.text = "Female"
        default:
            genderLabel.text = "-"
        }
    }
    
    func setUISlider(){
        ratingLabel.text = "Rating"
        ratingSlider.minimumValue = 1
        ratingSlider.maximumValue = 5
        ratingSlider.value = 2.5
        ratingSlider.minimumTrackTintColor = .purple
        ratingSlider.maximumTrackTintColor = .orange
        ratingSlider.addTarget(self, action: #selector(handleSliderSetting(sender:)), for: .valueChanged)
    }
    
    @objc func handleSliderSetting(sender: UISlider){
        ratingLabel.text = "\(String(Int(ratingSlider.value))) stars"
    }
    
    
    func setUIField(){
        nameLabel.text = "Name"
        nameField.keyboardType = .webSearch
        nameField.tintColor = .purple
        nameField.placeholder = "Faster!"
        nameField.addTarget(self, action: #selector(handleFieldSetting), for: .editingDidEnd)
        nameField.delegate = self
    }
    
    @objc func handleFieldSetting(){
        guard nameField.text!.count < 10 else {
            let allert = UIAlertController(title: "Name format",
                                           message: "Your name shoud contain < 10 symbols",
                                           preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            allert.addAction(action)
            present(allert, animated: true, completion: nil)
            nameField.text = nil
            return
        }
        
        if nameField.text == ""{
            nameLabel.text = "-"
        } else {
            nameLabel.text = nameField.text
        }

        nameField.text = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setUIDatePicker(){
        birthdayLabel.text = "Birthday"
        birthdayDatePicker.datePickerMode = .date
        birthdayDatePicker.tintColor = .purple
        birthdayDatePicker.locale = Locale.init(identifier: "ru_Ru")
        birthdayDatePicker.addTarget(self, action: #selector(handleDatePickerSetting(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePickerSetting(sender : UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "ru_Ru")
        birthdayLabel.text = formatter.string(from: birthdayDatePicker.date)
    }
    
    func setUISwitch(){
        functionLabel.text = "Запретить изменения"
        functionLabel.numberOfLines = 2
        functionSwitch.onTintColor = .orange
        functionSwitch.addTarget(self, action: #selector(handleSwitchSetter(sender:)), for: .valueChanged)
    }
    
    @objc func handleSwitchSetter(sender : UISwitch){
        if sender.isOn {
            functionLabel.text = "Запретить изменения"
            setControllers(isHidden: false)
        } else {
            functionLabel.text = "Разрешить изменения"
            setControllers(isHidden: true)
        }
    }
    
    func setControllers(isHidden : Bool){
        nameField.isHidden = isHidden
        genderSegments.isHidden = isHidden
        birthdayDatePicker.isHidden = isHidden
        dayStepper.isHidden = isHidden
        ratingSlider.isHidden = isHidden
        apartTypePicker.isHidden = isHidden
        UIPickerField.isHidden = isHidden
    }
    
    func setUIPicker(){
        apartTypeLabel.text = "Apart"
        apartTypePicker = UIPickerView()
        apartTypePicker.delegate = self
        
        UIPickerField.inputView = apartTypePicker
    }
    
    @objc func stopEditing(){
        view.endEditing(true)
    }
    
    func setUIStepper(){
        dayCountLabel.text = "Duration"
        dayStepper.value = 1
        dayStepper.minimumValue = 1
        dayStepper.maximumValue = 7
        dayStepper.tintColor = .orange
        dayStepper.addTarget(self, action: #selector(handleStepperSetting(from:)), for: .valueChanged)
    }
    
    @objc func handleStepperSetting(from sender: UIStepper){
        dayCountLabel.text = "\(Int(sender.value)) day(s)"
    }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return apartTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow rowIndex: Int, forComponent: Int) -> String? {
        return apartTypes[rowIndex]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow rowIndex: Int, inComponent: Int){
        apartTypeLabel.text = apartTypes[rowIndex]
        UIPickerField.text = String(rowIndex)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerViewLabel : UILabel
        
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        } else {
            pickerViewLabel = UILabel()
        }
        
        pickerViewLabel.textColor = .purple
        pickerViewLabel.textAlignment = .center
        pickerViewLabel.text = apartTypes[row]
        
        return pickerViewLabel
    }
}

extension ViewController : UITextFieldDelegate{
    
}
