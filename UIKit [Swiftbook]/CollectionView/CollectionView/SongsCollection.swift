//
//  SongsCollection.swift
//  CollectionView
//
//  Created by Артём on 16.06.2021.
//

import UIKit

private let cellReuseIdentifier = "CustomCell"

class SongsCollection: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let songs = ["Джарахов & Markul - Я в моменте", "HammAli & Navai - Птичка", "BRANYA & MACAN - Пополам", "Баста - Ты была права", "The Limba & Скриптонит - Ронин", "Джарахов & Markul - Я в моменте", "HammAli & Navai - Птичка", "BRANYA & MACAN - Пополам", "Баста - Ты была права", "The Limba & Скриптонит - Ронин", "Джарахов & Markul - Я в моменте", "HammAli & Navai - Птичка", "BRANYA & MACAN - Пополам", "Баста - Ты была права", "The Limba & Скриптонит - Ронин", "Джарахов & Markul - Я в моменте", "HammAli & Navai - Птичка", "BRANYA & MACAN - Пополам", "Баста - Ты была права", "The Limba & Скриптонит - Ронин"]
    
    var verticalPadding : CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(SongsCollectionCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
        
        verticalPadding = collectionView.frame.width * 0.05
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "GettingSongInfo"){
                if let cell = sender as? UICollectionViewCell,
                       let indexPath = self.collectionView.indexPath(for: cell) {
                    
                    let destinationVC = segue.destination as! SongInformation
                    destinationVC.songName = songs[indexPath.row]
            }
        }

    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if let cell = collectionView.cellForItem(at: indexPath) as? SongsCollectionCell {
            let vc = SongInformation()
            vc.songName = cell.wrappedSongName
            self.present(vc, animated: true, completion: nil)
        }
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! SongsCollectionCell
        
        cell.wrappedSongName = songs[indexPath.row]
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let coverSize = (collectionView.frame.width - verticalPadding * 3)/2
        return CGSize(width: coverSize, height: coverSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: verticalPadding, bottom: 20, right: verticalPadding)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let horizontalPadding = verticalPadding * 2
        return horizontalPadding
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

