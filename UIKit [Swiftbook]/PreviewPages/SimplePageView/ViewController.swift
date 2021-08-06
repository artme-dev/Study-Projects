//
//  ViewController.swift
//  SimplePageView
//
//  Created by Артём on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        showPreview()
    }
    
    func showPreview(){
        if let previewVC = storyboard?.instantiateViewController(withIdentifier: "PageVC") as? PageVC{
            present(previewVC, animated: true, completion: nil)
        }
    }


}

