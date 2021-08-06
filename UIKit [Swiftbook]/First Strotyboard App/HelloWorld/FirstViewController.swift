//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ivan Akulov on 25/01/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var LoginTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    @IBAction func tryToLogin(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? SecondeViewController else { return }
        
        dest.username = LoginTF.text
        dest.password = PasswordTF.text
    }
    
    @IBAction func unwindToMain(segue : UIStoryboardSegue){
        guard segue.identifier == "UnwindSegue" else { return }
        guard segue.source is SecondeViewController else { return }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
