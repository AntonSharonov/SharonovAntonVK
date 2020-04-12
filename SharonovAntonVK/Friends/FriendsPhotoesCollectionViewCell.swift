//
//  FriendsPhotoesCollectionViewCell.swift
//  SharonovAntonVK
//
//  Created by mac on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class FriendsPhotoesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var friendPhoto: UIImageView!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var likeCount: UILabel!
    
    var isLiked = false
    var likeCounter = 0
    
    @IBAction func changeLike() {
        
        if isLiked == false {
            likeCounter += 1
            likeImage.image = UIImage(systemName: "heart.fill")
            likeCount.text = "\(likeCounter) liked"
            isLiked = true
        } else {
            likeCounter -= 1
            likeImage.image = UIImage(systemName: "heart")
            likeCount.text = "\(likeCounter) liked"
            isLiked = false
        }
    }
    

  
}
