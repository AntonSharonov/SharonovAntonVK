//
//  AllGroupsTableViewCell.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {
    @IBOutlet weak var allGroupName: UILabel!
    @IBOutlet weak var allGroupLogo: UIImageView!
    @IBOutlet weak var allGroupLogoControl: GroupAvatarControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(clickOnControl))
        allGroupLogo.addGestureRecognizer(tapGesture)
    }
    
    @objc func clickOnControl() {
        self.allGroupLogo.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(
            withDuration: 1,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                self.allGroupLogo.transform = .identity
        })
    }
}
