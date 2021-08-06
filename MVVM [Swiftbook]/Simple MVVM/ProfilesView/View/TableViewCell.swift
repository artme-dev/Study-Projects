//
//  TableViewCell.swift
//  Simple MVVM
//
//  Created by Артём on 20.07.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var profileCellVM: ProfileCellVM? {
        willSet{
            guard let model = newValue else { return }
            fullNameLabel.text = model.fullName
            ageLabel.text = model.age
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
