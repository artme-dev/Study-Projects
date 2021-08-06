//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Артём on 16.06.2021.
//

import UIKit

class SongsCollectionCell: UICollectionViewCell {
    
    private let cover = UIImageView()
    private var songName = ""
    
    var wrappedSongName : String {
        get {
            return songName
        }
        set {
            songName = newValue
            cover.image = UIImage(named: songName)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(cover)
        
        cover.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        cover.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        cover.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        cover.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        cover.translatesAutoresizingMaskIntoConstraints = false
        cover.contentMode = .scaleAspectFill
        cover.clipsToBounds = true
        cover.layer.cornerRadius = 5
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
