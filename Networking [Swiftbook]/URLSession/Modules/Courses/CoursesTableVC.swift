//
//  CorsesTableVC.swift
//  URLSession
//
//  Created by Артём on 25.07.2021.
//

import UIKit

private let reuseIdentifier = "CoursesTableCell"

class CoursesTableVC: UITableViewController {
    
    var courses: [Course]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AlamofireNetworkService.easyFetchData { courses in
            self.courses = courses
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        tableView.register(CoursesTableCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let courses = courses else { return UITableViewCell() }
        
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        let cell = reusableCell as? CoursesTableCell ?? CoursesTableCell()
        
        let course = courses[indexPath.row]
        var configuration = cell.defaultContentConfiguration()
        configuration.text = course.name
        if let numberOfLessons = course.numberOfLessons,
           let numberOfTests = course.numberOfTests{
            configuration.secondaryText = "\(numberOfLessons) lessons and \(numberOfTests) tests"
        }
    
        cell.contentConfiguration = configuration
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let courses = courses else { return }
        let course = courses[indexPath.row]
        
        let webVC = WebDescriptionVC()
        webVC.url = course.link
        navigationController?.pushViewController(webVC, animated: true)
    }
}
