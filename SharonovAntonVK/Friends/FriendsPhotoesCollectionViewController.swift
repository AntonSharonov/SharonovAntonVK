//
//  FriendsPhotoesCollectionViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class FriendsPhotoesCollectionViewController: UICollectionViewController {
    
    var friendPhoto: User!
    var selectedPhotoIndex = 0
    
    var friendCollection: FriendsTableViewController!
    
    override func viewWillDisappear(_ animated: Bool) {
        print("коллекция: viewWillDisappear: selectedPhotoIndex = \(selectedPhotoIndex) - здесь сидит нужный индекс\n")
        
     }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("................. 1 экран - viewDidLoad .................")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendPhoto.photoes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendPhotoCell", for: indexPath) as! FriendsPhotoesCollectionViewCell
        
        let photo = friendPhoto.photoes[indexPath.row]
        cell.friendPhotoInCell.image = photo
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhotoIndex = indexPath.item
//        let ggg = PhotoSliderViewController()
//        let uuu = ggg.currentPhotoIndex
        
        print("коллекшнвью didSelectItemAt: selectedPhotoIndex = \(selectedPhotoIndex) - нужный индекс выбранной ячейки\n")
        
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoSliderViewController = segue.destination as? PhotoSliderViewController {

            let selectedFriend = friendPhoto.photoes
                  photoSliderViewController.photos = selectedFriend

//            collectionView(<#T##collectionView: UICollectionView##UICollectionView#>, didDeselectItemAt: )
//             print("сначала индекс текущего фото, берется со слайдера \(photoSliderViewController.currentPhotoIndex) и присваиваем ему индекс выбранного фото по умолчанию \(selectedPhotoIndex)")
//
            photoSliderViewController.currentPhotoIndex = selectedPhotoIndex
//

            print("prepare фор сегвей: selectedPhotoIndex = \(selectedPhotoIndex) и currentPhotoIndex = \(photoSliderViewController.currentPhotoIndex) - по умолчанию\n")



        }
    }
}

extension FriendsPhotoesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfCellsInLine: CGFloat = 2
        let cellSpacing: CGFloat = 5
        
        let cellWidth = floor((collectionView.bounds.width - cellSpacing * (numberOfCellsInLine + 1)) / numberOfCellsInLine)
        
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
