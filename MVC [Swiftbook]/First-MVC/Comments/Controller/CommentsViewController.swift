//
//  ViewController.swift
//  First-MVC
//
//  Created by Артём on 14.07.2021.
//

import UIKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var comments = [Comment]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        CommentNetworkService.loadComments{ responce in
            self.comments = responce.comments
            self.tableView.reloadData()
        }
    }
}

extension CommentsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let comment = comments[indexPath.row]
        cell.configureState(with: comment)
        return cell
    }
}

extension CommentsViewController: UITableViewDelegate{
    
}

