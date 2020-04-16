//
//  MyGroupsTableViewCell.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class MyGroupsTableViewCell: UITableViewCell {
    @IBOutlet weak var myGroupName: UILabel!
    @IBOutlet weak var myGroupLogo: UIImageView!
    
    @IBAction func pressOnAvatar() {
        self.myGroupLogo.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(
            withDuration: 1,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                self.myGroupLogo.transform = .identity
        })
    }
}
