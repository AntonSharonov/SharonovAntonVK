//
//  ButtonWithCounter.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 12/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

//@IBDesignable не работает!
class ButtonWithCounter: UIControl {
    
    @IBInspectable var icon: UIImage?
    @IBInspectable var iconFill: UIImage?
    @IBInspectable var staticColor: UIColor?
    @IBInspectable var fillColor: UIColor?
    
    var isFilled = false
    var count = 0
    
    let imageView = UIImageView()
    let labelView = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 70.0),
            self.heightAnchor.constraint(equalToConstant: 40.0),
        ])
        
        self.tintColor = self.staticColor
        
        imageView.image = icon
        imageView.contentMode = .scaleAspectFit
        
        labelView.text = "\(count)"
        labelView.textColor = self.staticColor
        labelView.font = labelView.font.withSize(20.0)
        labelView.textAlignment = .center
        
        imageView.isUserInteractionEnabled = false
        labelView.isUserInteractionEnabled = false
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalToConstant: 30.0),
            imageView.heightAnchor.constraint(equalToConstant: 30.0),
        ])
        
        addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            labelView.widthAnchor.constraint(equalToConstant: 30.0),
            labelView.heightAnchor.constraint(equalToConstant: 30.0),
        ])
        
        self.addTarget(self, action: #selector(clickOnControl), for: .touchUpInside)
    }
    
    @objc func clickOnControl() {
        
        UIView.transition(
            with: imageView,
            duration: 1.0,
            options: .transitionFlipFromRight,
            animations: {}
        )
        
            if isFilled == false {
                isFilled = true
                count += 1
                labelView.text = "\(count)"
                imageView.image = iconFill
                tintColor = fillColor
                
                
 
            } else {
                isFilled = false
                count -= 1
                labelView.text = "\(count)"
                imageView.image = icon
                tintColor = staticColor

            }
        }
}


