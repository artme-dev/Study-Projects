//
//  TableViewCell.swift
//  First-MVC
//
//  Created by Артём on 14.07.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentText: UITextView!
    
    func configureState(with comment: Comment){
        self.titleLabel.text = comment.name
        self.commentText.text = comment.body
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
