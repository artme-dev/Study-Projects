//
//  FirstNavVC.swift
//  UniversalUIKit
//
//  Created by Артём on 16.07.2021.
//

import UIKit

class FirstNavVC: UIViewController {
    @IBOutlet weak var NameTextField: UITextField!
    
    @IBAction func goAhead(_ sender: UIButton) {
        performSegue(withIdentifier: "goAhead", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let name = NameTextField.text else { return }
        guard
            let destination = segue.destination as? SecondNavVC,
            segue.identifier == "goAhead"
        else { return }

        let greetingTarget = name.isEmpty == false ? name : "world"
        destination.labelText = "Hello, \(greetingTarget)!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
