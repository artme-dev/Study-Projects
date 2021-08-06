//
//  ViewController.swift
//  TextViewEditor
//
//  Created by Артём on 05.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var sizeStepper: UIStepper!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.cornerRadius = 7
        textView.backgroundColor = UIColor.init(white: 0, alpha: 0)
        textView.textAlignment = .justified
        textView.font = UIFont(name: "Zapfino", size: 12)
        textView.delegate = self
        textView.isHidden = true
        textView.alpha = 0
        
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        
        view.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0,
                       delay: 2,
                       options: .curveEaseInOut,
                       animations: { self.textView.alpha = 1 }) { (finished) in
            self.indicator.stopAnimating()
            self.textView.isHidden = false
            self.view.isUserInteractionEnabled = true
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(resizeTextCause(notofication:)),
                                               name: UITextView.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(resizeTextCause(notofication:)),
                                               name: UITextView.keyboardWillHideNotification,
                                               object: nil)
        
    
        
        sizeStepper.minimumValue = 8
        sizeStepper.maximumValue = 18
        sizeStepper.value = 12
        sizeStepper.addTarget(self, action: #selector(setTextSize(withStepper:)), for: .valueChanged)
        
    }
    
    @objc func setTextSize(withStepper stepper: UIStepper){
        let currentFont = textView.font!
        textView.font = currentFont.withSize(CGFloat(stepper.value))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func resizeTextCause(notofication : Notification){
        guard let userInfo = notofication.userInfo as? [String : Any],
              let keyboardRectangle = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else {
            print("Smt went wrong")
            return
        }
        
        if(notofication.name == UITextView.keyboardWillShowNotification){
            textView.contentInset = UIEdgeInsets(top: 0, left: 0,
                                                 bottom: keyboardRectangle.height - bottomConstraint.constant*2,
                                                 right: 0)
        }
        
        if(notofication.name == UITextView.keyboardWillHideNotification){
            textView.contentInset = UIEdgeInsets.zero
        }
        
        textView.scrollIndicatorInsets = textView.contentInset
        textView.scrollRangeToVisible(textView.selectedRange)
    }

}

extension ViewController : UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.init(white: 1, alpha: 1)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.init(white: 0, alpha: 0)
    }
}

