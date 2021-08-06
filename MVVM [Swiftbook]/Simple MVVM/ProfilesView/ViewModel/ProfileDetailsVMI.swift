//
//  ProfileDetailsVMI.swift
//  Simple MVVM
//
//  Created by Артём on 21.07.2021.
//

import Foundation

class ProfileDetailsVMI: ProfileDetailsVM{
    private var profile: Profile
    
    var description: Box<String> = Box("")
    
    init(from profile: Profile){
        self.profile = profile
        description = Box(description(of: profile))
    }
    
    func description(of profile: Profile) -> String{
        return "\(profile.name) \(profile.secondName) is \(profile.age) years old"
    }
    
    func rejuvenatePerson() {
        profile.age -= 1
        description.value = description(of: profile)
    }
}
