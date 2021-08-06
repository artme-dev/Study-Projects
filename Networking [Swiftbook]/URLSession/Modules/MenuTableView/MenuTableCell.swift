//
//  MenuTableCell.swift
//  URLSession
//
//  Created by Артём on 25.07.2021.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    private var menuOptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: CGFloat(24))
        return label
    }()

    var menuOptionTitle: String? {
        get {
            return menuOptionLabel.text
        }
        set {
            menuOptionLabel.text = newValue
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(menuOptionLabel)
        backgroundColor = .clear
        setupConstraints()
    }
    
    
    func setupConstraints(){
        menuOptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        menuOptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: 20).isActive = true
        menuOptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                             constant: -20).isActive = true
        menuOptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                             constant: 20).isActive = true
        menuOptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                             constant: -20).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected{
            backgroundColor = .orange
            UIView.animate(withDuration: 1) {
                [unowned self] in
                self.backgroundColor = .clear
            }
        }
    }
}
