//
//  DetailViewController.swift
//  Simple MVVM
//
//  Created by Артём on 21.07.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    var profileDetailsVM: ProfileDetailsVM?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let detailsVM = profileDetailsVM else { return }
        descriptionLabel.text = detailsVM.description.value
    }
    
    
    override func viewDidLoad() {
        actionButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        profileDetailsVM?.description.bind({ [unowned self] in self.descriptionLabel.text = $0 })
    }
    
    @objc func action(){
        profileDetailsVM?.rejuvenatePerson()
    }
}
