//
//  PhotoSliderViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 22/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

enum PanGestureDirection {
    case none
    case left
    case right
}

class PhotoSliderViewController: UIViewController {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var photos: [String] = ["alex1", "alex2", "bob1", "bob2", "alex3"]
    var currentPhotoIndex = 0
    var currentPanGestureDirection: PanGestureDirection = .none
    
    let scaleTo90Percent = CGAffineTransform(scaleX: 0.9, y: 0.9)
    let scaleTo110Percent = CGAffineTransform(scaleX: 1.1, y: 1.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(panGestureRec)
        setImages()
    }
    
    func setImages() {
        var leftPhotoIndex: Int = currentPhotoIndex - 1
        let middlePhotoIndex: Int = currentPhotoIndex
        var rightPhotoIndex: Int = currentPhotoIndex + 1
        
        if leftPhotoIndex < 0 { leftPhotoIndex = photos.count - 1 }
        if rightPhotoIndex > photos.count - 1 { rightPhotoIndex = 0 }
        
        leftImageView.image = UIImage(named: photos[leftPhotoIndex])
        middleImageView.image = UIImage(named: photos[middlePhotoIndex])
        rightImageView.image = UIImage(named: photos[rightPhotoIndex])
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
            
        case .began:
            UIView.animate(withDuration: 0.3, animations: { self.middleImageView.alpha = 0.6 })
            
        case .changed:
            let translationX = recognizer.translation(in: middleImageView).x
            currentPanGestureDirection = translationX > 0 ? .right : .left
            
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    
                    self.middleImageView
                        .transform = CGAffineTransform(translationX: translationX, y: 0)
                            .concatenating(self.scaleTo90Percent)
                    
                    if self.currentPanGestureDirection == .left {
                        
                        self.rightImageView
                            .transform = CGAffineTransform(translationX: translationX, y: 0)
                                .concatenating(self.scaleTo110Percent)
                        self.leftImageView
                            .transform = CGAffineTransform(translationX: translationX, y: 0)
                                .concatenating(self.scaleTo110Percent)
                        
                    } else {
                        
                        self.rightImageView
                            .transform = CGAffineTransform(translationX: translationX, y: 0)
                                .concatenating(self.scaleTo110Percent)
                        self.leftImageView
                            .transform = CGAffineTransform(translationX: translationX, y: 0)
                                .concatenating(self.scaleTo110Percent)
                    }
            })
            
        case .ended:
            if currentPanGestureDirection == .left {
                currentPhotoIndex += 1
                if currentPhotoIndex > photos.count - 1 { currentPhotoIndex = 0 }
                
            } else {
                currentPhotoIndex -= 1
                if currentPhotoIndex < 0 { currentPhotoIndex = photos.count - 1 }
            }
            
            middleImageView.alpha = 1
            middleImageView.transform = .identity
            leftImageView.transform = .identity
            rightImageView.transform = .identity
                        
            setImages()
            
        default: return
            
        }
    }
}


