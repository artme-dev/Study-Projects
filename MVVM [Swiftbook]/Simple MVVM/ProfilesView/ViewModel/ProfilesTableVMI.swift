//
//  SimpleProfilesVM.swift
//  Simple MVVM
//
//  Created by Артём on 20.07.2021.
//

import Foundation

class ProfilesTableVMI: ProfilesTableVM{
    private var profiles: [Profile]
    private var selectedRow: IndexPath?
    
    init(){
        profiles = [
            Profile(name: "John", secondName: "Walker", age: 86),
            Profile(name: "Mary", secondName: "Wilson", age: 21),
            Profile(name: "Dan", secondName: "Moor", age: 37),
            Profile(name: "Peter", secondName: "Taylor", age: 17),
            Profile(name: "William", secondName: "Anderson", age: 42)
        ]
    }
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> ProfileCellVM? {
        let profile = profiles[indexPath.row]
        return ProfileCellVMI(from: profile)
    }
    
    func selectRow(at indexPath: IndexPath) {
        self.selectedRow = indexPath
    }
    
    func viewModelForSelectedRow() -> ProfileDetailsVM? {
        guard let selectedRow = selectedRow else { return nil }
        let profile = profiles[selectedRow.row]
        return ProfileDetailsVMI(from: profile)
    }
}
