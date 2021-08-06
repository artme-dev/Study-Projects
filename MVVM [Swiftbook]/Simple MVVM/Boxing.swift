//
//  Boxing.swift
//  Simple MVVM
//
//  Created by Артём on 21.07.2021.
//

import Foundation

class Box<T>{
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value: T){
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener){
        self.listener = listener
        listener(value)
    }
}
