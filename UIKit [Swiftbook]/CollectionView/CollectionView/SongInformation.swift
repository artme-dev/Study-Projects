//
//  SongInformation.swift
//  CollectionView
//
//  Created by Артём on 18.06.2021.
//

import UIKit

class SongInformation: UIViewController {
        var songName = ""
    
        var songCoverImage = UIImageView()
        var songTitleLabel = UILabel()

        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .orange
            view = UIView()
            view.backgroundColor = .white

            songCoverImage.image = UIImage(named: songName)
            view.addSubview(songCoverImage)
            songCoverImage.translatesAutoresizingMaskIntoConstraints = false
            songCoverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            songCoverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            songCoverImage.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
            songCoverImage.heightAnchor.constraint(equalTo: songCoverImage.widthAnchor, multiplier: 1).isActive = true

            view.addSubview(songTitleLabel)
            songTitleLabel.text = songName
            songTitleLabel.numberOfLines = 0
            songTitleLabel.textAlignment = .center
            songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            songTitleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant:  20).isActive = true
            songTitleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20).isActive = true
            songTitleLabel.topAnchor.constraint(equalTo: songCoverImage.bottomAnchor, constant: 40).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
