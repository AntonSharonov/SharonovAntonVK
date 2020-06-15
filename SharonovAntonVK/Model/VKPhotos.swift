//
//  VKPhotos.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 25/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class PhotoSizes: Object, Codable {
    @objc dynamic var url: String
    @objc dynamic var type: String
}

class VKPhoto: Object, Codable {
    @objc dynamic var ownerId: Int
//    let sizes: [PhotoSizes]
//
//    enum CodingKeys: String, CodingKey {
//        case ownerId = "owner_id"
//        case sizes
//    }
}

struct FriendsPhotosResponse: Codable {
    let count: Int
    let items: [VKPhoto]
}

struct PhotosResponse: Codable {
    let response: FriendsPhotosResponse
}

class PhotosService {
    
    func loadPhotosData(completion: @escaping () -> Void) {
        
        AF.request("https://api.vk.com/method/photos.getAll",
                   parameters: [
                    "access_token" : Session.instance.token,
                    "owner_id" : "17212157",
                    "v" : Session.instance.apiVersion
        ]).responseData { response in
            
            do {
                let photos = try JSONDecoder().decode(PhotosResponse.self, from: response.value!)
                self.savePhotosData(photos.response.items)
                completion()
//                print(photos)
            } catch {
                print(error)
            }
        }
    }
    
        func savePhotosData(_ photos: [VKPhoto]) {
            
    //        let realm = try! Realm()
            let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
            let realm = try! Realm(configuration: config)
//            print(realm.configuration.fileURL!)
            
            do {
    //            let realm = try Realm()
                realm.beginWrite()
                
                realm.add(photos, update: .modified)
                
                try realm.commitWrite()
            } catch {
                print(error)
            }
        }
}
