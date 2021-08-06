//
//  SecondeViewController.swift
//  HelloWorld
//
//  Created by Артём on 18.01.2021.
//

import UIKit

class SecondeViewController: UIViewController {
    @IBOutlet weak var message: UILabel!
    
    private let correctPassword = "artem"
    
    var username : String?
    var password : String?

    override func viewDidLoad() {
        guard let username = username, let password = password else {
            return
        }
        var msg : String = ""
        
        if(!username.isEmpty){
            msg.append("Hello, \(username) \n")
        }
        if(password == correctPassword){
            msg.append("You are a hacker!")
        }
        if (msg.isEmpty){
            msg = "I don't know you!"
        }
        
        message.text = msg
    }

}
