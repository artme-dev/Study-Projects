//
//  ProfileDetailsVM.swift
//  Simple MVVM
//
//  Created by Артём on 21.07.2021.
//

import Foundation

protocol ProfileDetailsVM{
    var description: Box<String> { get }
    func rejuvenatePerson()
}
