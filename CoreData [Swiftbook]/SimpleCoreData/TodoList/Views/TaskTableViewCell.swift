//
//  TaskTableViewCell.swift
//  SimpleCoreData
//
//  Created by Артём on 20.08.2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    var index: Int?{
        didSet{
            checkboxButton.index = index
        }
    }
    
    var toggleHandler: ((Bool, Int)->Void)?{
        didSet{
            checkboxButton.toggleHandler = {
                isChecked, index in
                self.setTaskDone(isDone: isChecked)
                self.toggleHandler?(isChecked, index)
            }
        }
    }
    
    var taskName: String?{
        get { taskNameLabel.text }
        set { taskNameLabel.text = newValue }
    }
    var isDone: Bool?{
        get {
            checkboxButton.isChecked
            
        }
        set {
            checkboxButton.isChecked = newValue
            setTaskDone(isDone: newValue ?? false)
        }
    }
    private let taskNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let checkboxButton: CheckBoxBotton = {
        let button = CheckBoxBotton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.contentMode = .center
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(checkboxButton)
        contentStackView.addArrangedSubview(taskNameLabel)
        
        contentStackView.fillSuperview(padding: UIEdgePaddings(top: 0, trailing: 20, bottom: 0, leading: 20))
    }
    
    private func setTaskDone(isDone: Bool){
        if isDone{
            taskNameLabel.textColor = .lightGray
        } else {
            taskNameLabel.textColor = .black
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
