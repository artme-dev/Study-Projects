//
//  ProfilesViemModel.swift
//  Simple MVVM
//
//  Created by Артём on 20.07.2021.
//

import Foundation

protocol ProfilesTableVM {
    func numberOfRows() -> Int
    func cellViewModel(for indexPath: IndexPath) -> ProfileCellVM?
    
    func selectRow(at indexPath: IndexPath)
    func viewModelForSelectedRow() -> ProfileDetailsVM?
}
