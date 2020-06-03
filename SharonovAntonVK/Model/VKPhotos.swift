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
    @objc dynamic let url: String
    @objc dynamic let type: String
}

struct VKPhoto: Codable {
    let owner_id: Int
    let sizes: [PhotoSizes]
}

struct FriendsPhotosResponse: Codable {
    let count: Int
    let items: [VKPhoto]
}

struct PhotosResponse: Codable {
    let response: FriendsPhotosResponse
}

class PhotosService {
    
    func loadPhotosData(completion: @escaping ([PhotoSizes]) -> Void) {
        
        AF.request("https://api.vk.com/method/photos.getAll",
                   parameters: [
                    "access_token" : Session.instance.token,
                    "owner_id" : "17212157",
                    "v" : Session.instance.apiVersion
        ]).responseData { response in
            
            do {
                let photos = try JSONDecoder().decode(PhotosResponse.self, from: response.value!)
//                completion(photos.response.items)
                print(photos)
            } catch {
                print(error)
            }
        }
    }
}
