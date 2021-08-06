//
//  ViewController.swift
//  SimpleRecognizer
//
//  Created by Артём on 21.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Tap: UIView!
    @IBOutlet weak var Pinch: UIView!
    @IBOutlet weak var Rotation: UIView!
    @IBOutlet weak var Swipe: UIView!
    @IBOutlet weak var Pan: UIView!
    @IBOutlet weak var LongPress: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRec = UITapGestureRecognizer(target: self, action: #selector(tapHandle))
        Tap.addGestureRecognizer(tapRec)
        
        let pinchRec = UIPinchGestureRecognizer(target: self, action: #selector(pinchHandle))
        Pinch.addGestureRecognizer(pinchRec)
        
        let rotationRec = UIRotationGestureRecognizer(target: self, action: #selector(rotationHandle))
        Rotation.addGestureRecognizer(rotationRec)
        
        let swipeRec = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandle))
        Swipe.addGestureRecognizer(swipeRec)
        
        let panRec = UIPanGestureRecognizer(target: self, action: #selector(panHandle))
        Pan.addGestureRecognizer(panRec)
        
        let longRec = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandle))
        LongPress.addGestureRecognizer(longRec)
    }
    
    @objc func tapHandle(){
        Tap.backgroundColor = .purple
    }
    @objc func pinchHandle(){
        Pinch.backgroundColor = .purple
    }
    @objc func rotationHandle(){
        Rotation.backgroundColor = .purple
    }
    @objc func swipeHandle(){
        Swipe.backgroundColor = .purple
    }
    @objc func panHandle(){
        Pan.backgroundColor = .purple
    }
    @objc func longPressHandle(){
        LongPress.backgroundColor = .purple
    }

}

