//
//  FriendsTableViewCell.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendAvatarView: UIView!
}

final class FriendAvatarView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 3, height: 3)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}

final class FriendAvatar: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
