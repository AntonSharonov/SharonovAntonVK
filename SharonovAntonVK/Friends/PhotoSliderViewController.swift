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
    
    var swipeToLeft = UIViewPropertyAnimator()
    var swipeToRight = UIViewPropertyAnimator()
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var photos: [String] = ["alex1", "alex2", "bob1"]
    var currentPhoto = 0
    var currentPanGestureDirection: PanGestureDirection = .none
    
    let scaleTo90Percent = CGAffineTransform(scaleX: 0.9, y: 0.9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(panGestureRec)
        setImages()
    }
    
    func setImages() {
        var indexOfLeftPhoto: Int = currentPhoto - 1
        let indexOfMiddlePhoto: Int = currentPhoto
        var indexOfRightPhoto: Int = currentPhoto + 1
        
        if indexOfLeftPhoto < 0 { indexOfLeftPhoto = photos.count - 1 }
        if indexOfRightPhoto > photos.count - 1 { indexOfRightPhoto = 0 }
        
        leftImageView.image = UIImage(named: photos[indexOfLeftPhoto])
        middleImageView.image = UIImage(named: photos[indexOfMiddlePhoto])
        rightImageView.image = UIImage(named: photos[indexOfRightPhoto])
        
//        self.middleImageView.transform = scaleTo90Percent
//        self.rightImageView.transform = scaleTo90Percent
//        self.leftImageView.transform = scaleTo90Percent
//
//        UIView.animate(
//            withDuration: 1,
//            delay: 0,
//            animations: {
//                self.middleImageView.transform = .identity
//                self.rightImageView.transform = .identity
//                self.leftImageView.transform = .identity
//        })
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .began: setImages()
//            swipeToRight = UIViewPropertyAnimator(
//                duration: 0.5,
//                curve: .easeInOut,
//                animations: {
//                    UIView.animate(
//                        withDuration: 0.01,
//                        delay: 0,
//                        animations: {
//                            let translation = CGAffineTransform(translationX: self.view.bounds.midX, y: 0)
//                            let transform = self.scaleTo90Percent.concatenating(translation)
//                            self.middleImageView.transform = transform
//                            self.rightImageView.transform = transform
//                            self.leftImageView.transform = transform
//                    }, completion: { _ in
//                        self.currentPhoto -= 1
//                        if self.currentPhoto < 0 {
//                            self.currentPhoto = self.photos.count - 1
//                        }
//                      self.setImages()
//                    })
//            })
//            swipeToLeft = UIViewPropertyAnimator(
//                duration: 0.5,
//                curve: .easeInOut,
//                animations: {
//                    UIView.animate(
//                        withDuration: 0.01,
//                        delay: 0,
//                        animations: {
//                            let translation = CGAffineTransform(translationX: -self.view.bounds.midX, y: 0)
//                            let transform = self.scaleTo90Percent.concatenating(translation)
//                            self.middleImageView.transform = transform
//                            self.rightImageView.transform = transform
//                            self.leftImageView.transform = transform
//                    }, completion: { _ in
//                        self.currentPhoto += 1
//                        if self.currentPhoto > self.photos.count - 1 {
//                            self.currentPhoto = 0
//                        }
//                     self.setImages()
//                    })
//            })
        case .changed:
            
            let translationX = recognizer.translation(in: self.view).x
            if translationX > 0 {
                swipeToRight.fractionComplete = abs(translationX)/100
            } else {
                swipeToLeft.fractionComplete = abs(translationX)/100
            }
            
        case .ended:
           swipeToRight.continueAnimation(withTimingParameters: nil, durationFactor: 0)
          swipeToLeft.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            return
        }
    }
}


