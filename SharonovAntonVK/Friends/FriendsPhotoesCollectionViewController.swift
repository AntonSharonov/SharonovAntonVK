//
//  FriendsPhotoesCollectionViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 04/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire

class FriendsPhotoesCollectionViewController: UICollectionViewController {
    
    var friendPhoto: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlConstructor = URLComponents()
             
             urlConstructor.scheme = baseScheme
             urlConstructor.host = baseHost
             urlConstructor.path = "/method/photos.getAll"
             urlConstructor.queryItems = [
                 URLQueryItem(name: "owner_id", value: "423011593"),
                 URLQueryItem(name: "access_token", value: Session.instance.token),
                 URLQueryItem(name: "v", value: Session.instance.apiVersion),
             ]
             
             URLSession.shared.dataTask(with: urlConstructor.url!) { data, response, error in
                 
                 guard let data = data else { return }
                 
                 do {
                     let photos = try JSONDecoder().decode(PhotosResponse.self, from: data)
                     print(photos)
                 } catch {
                     print(error)
                 }
             }.resume()
        
//        AF.request("https://api.vk.com/method/photos.getAll",
//                   parameters: [
//                    "access_token": Session.instance.token,
//                    "owner_id": "63020653",
//                    "v": "5.107"
//        ]).responseJSON { response in
//            print(response.value!)
//        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoSliderViewController = segue.destination as? PhotoSliderViewController {
            
            let selectedFriend = friendPhoto.photoes
            photoSliderViewController.photos = selectedFriend
            
            let friendsPhotoesCollectionViewController = segue.source as! FriendsPhotoesCollectionViewController
            if let indexPath = friendsPhotoesCollectionViewController.collectionView.indexPathsForSelectedItems {
                
                let selectedPhotoIndex = indexPath.first!.row
                photoSliderViewController.currentPhotoIndex = selectedPhotoIndex
            }
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
