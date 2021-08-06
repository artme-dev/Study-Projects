//
//  TableViewController.swift
//  Simple MVVM
//
//  Created by Артём on 20.07.2021.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    var profilesTableVM: ProfilesTableVM?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilesTableVM = ProfilesTableVMI()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        return profilesTableVM?.numberOfRows() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = (tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? ProfileTableViewCell)
        let cellVM = profilesTableVM?.cellViewModel(for: indexPath)
        
        guard
            let cellVM = cellVM,
            let cellView = tableViewCell
        else {
            return ProfileTableViewCell()
        }
        
        cellView.profileCellVM = cellVM

        return cellView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableVM = profilesTableVM else { return }
        
        tableVM.selectRow(at: indexPath)
        performSegue(withIdentifier: "showDetailView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showDetailView",
            let destination = segue.destination as? DetailViewController
        else { return }
        
        let detailVM = profilesTableVM?.viewModelForSelectedRow()
        destination.profileDetailsVM = detailVM
    }
}
