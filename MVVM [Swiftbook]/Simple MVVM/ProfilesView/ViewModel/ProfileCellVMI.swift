//
//  SimpleProfileCellVM.swift
//  Simple MVVM
//
//  Created by Артём on 20.07.2021.
//

import Foundation

class ProfileCellVMI: ProfileCellVM{
    private var profile: Profile
    
    var fullName: String{
        return "\(profile.name) \(profile.secondName)"
    }
    
    var age: String{
        return "\(profile.age) years"
    }
    
    init(from profile: Profile){
        self.profile = profile
    }
}
