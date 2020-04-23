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
    
    //    var swipeToLeft = UIViewPropertyAnimator()
    //    var swipeToRight = UIViewPropertyAnimator()
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    var photos: [String] = ["alex1", "alex2", "bob1", "bob2", "alex3"]
    var currentPhotoIndex = 0
    var currentPanGestureDirection: PanGestureDirection = .none
    
        let scaleTo90Percent = CGAffineTransform(scaleX: 0.9, y: 0.9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(panGestureRec)
        setImages()
        animateImages()
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
    
    
    func animateImages() {
            self.middleImageView.transform = scaleTo90Percent
            self.rightImageView.transform = scaleTo90Percent
            self.leftImageView.transform = scaleTo90Percent
    
            UIView.animate(
                withDuration: 1,
                delay: 0,
                animations: {
                    self.middleImageView.transform = .identity
                    self.rightImageView.transform = .identity
                    self.leftImageView.transform = .identity
            })
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
                   self.middleImageView.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
                      self.rightImageView.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
                      self.leftImageView.transform = CGAffineTransform(scaleX: 0.99, y: 0.99)
              
                      UIView.animate(
                        withDuration: 1,
                          delay: 0,
                          animations: {
                              self.middleImageView.transform = .identity
                              self.rightImageView.transform = .identity
                              self.leftImageView.transform = .identity
                      })
                   
                   
                   
            let translationX = recognizer.translation(in: middleImageView).x
            print(translationX)
            print(currentPhotoIndex)
            currentPanGestureDirection = translationX > 0 ? .right : .left
            
            
            //            if translationX > 0 {
            //                     swipeToRight.fractionComplete = translationX/view.bounds.width
            
            
            
            //                currentPhotoIndex -= 1
            
            //                print(currentPhotoIndex)
            
            
            
            
            
            
            
            //                      if self.currentPhotoIndex < 0 {
            //                          self.currentPhotoIndex = self.photos.count - 1
            //                      } else {
            //                        self.currentPhotoIndex -= 1
            //                }
            //            } else {
            
            //                currentPhotoIndex += 1
            
            //                     print(currentPhotoIndex)
            
            
            
            //                swipeToLeft.fractionComplete = translationX/view.bounds.width
            
            //                           if self.currentPhotoIndex > self.photos.count - 1 {
            //                               self.currentPhotoIndex = 0
            //                           } else {
            //                            self.currentPhotoIndex += 1
            //                }
            //            }
            
        case .ended:
            
            
             
            if currentPanGestureDirection == .left {
                currentPhotoIndex += 1
                
                if currentPhotoIndex > photos.count - 1 { currentPhotoIndex = 0 }
                
                print(currentPhotoIndex)
            } else {
                currentPhotoIndex -= 1
                
                if currentPhotoIndex < 0 { currentPhotoIndex = photos.count - 1 }
                
                print(currentPhotoIndex)
            }
            
            setImages()
            
            
            //           swipeToRight.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        //          swipeToLeft.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            return
        }
    }
}


