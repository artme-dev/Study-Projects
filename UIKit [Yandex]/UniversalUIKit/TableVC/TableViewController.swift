//
//  TableViewController.swift
//  UniversalUIKit
//
//  Created by Артём on 16.07.2021.
//

import UIKit

class TableViewController: UITableViewController {
    let sectionNames: [Int: String] = {
        var  dict = [Int: String]()
        dict[0] = "News posts"
        dict[1] = "Top songs"
        dict[2] = "Super"
        return dict
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DinamicLabrary.generateElements()
    }
}

extension TableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Library.content[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = Library.content[indexPath.section][indexPath.row]
        
        var cell: UITableViewCell
        
        let id = sectionNames[indexPath.section] ?? ""
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: id){
            cell = reusableCell
        } else {
            let style: UITableViewCell.CellStyle
            switch indexPath.section {
            case 0:
                style = .value1
            default:
                style = .subtitle
            }
            cell = UITableViewCell(style: style, reuseIdentifier: id)
        }
        
        cell.textLabel?.text = content.title
        cell.detailTextLabel?.text = content.text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
}

extension TableViewController{
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 50
        } else { return 20 }
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UIView()
        if section == 2{
            let button = SimpleFooterButton.button
            button.addTarget(self, action: #selector(generatePosts), for: .touchUpInside)
            footer.addSubview(button)
            button.centerYAnchor.constraint(equalTo: footer.centerYAnchor).isActive = true
            button.centerXAnchor.constraint(equalTo: footer.centerXAnchor).isActive = true
        }
        return footer
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
    
    @objc func generatePosts(){
        DinamicLabrary.generateElements()
        tableView.beginUpdates()
        let lastRowIndex = DinamicLabrary.elements.count - 1
        let indexes = [IndexPath(row: 0, section: 2), IndexPath(row: lastRowIndex, section: 2)]
        tableView.insertRows(at: indexes, with: .automatic)
        tableView.endUpdates()
    }
}

class SimpleFooterButton{
    static let button: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.cornerRadius = 3
        button.setTitle("Generate!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}
