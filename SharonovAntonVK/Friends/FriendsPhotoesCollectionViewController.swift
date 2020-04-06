//
//  FriendsPhotoesCollectionViewController.swift
//  SharonovAntonVK
//
//  Created by mac on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class FriendsPhotoesCollectionViewController: UICollectionViewController {
    
    var friendPhoto: User!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendPhoto.photoes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendPhotoCell", for: indexPath) as! FriendsPhotoesCollectionViewCell
        
        let photo = friendPhoto.photoes[indexPath.row]
        cell.friendPhoto.image = photo
        
        return cell
    }
}
