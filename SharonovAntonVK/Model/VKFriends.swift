//
//  VKFriends.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 20/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

class VKUser: Object, Codable {
    @objc dynamic let firstName: String
    @objc dynamic let lastName: String
    @objc dynamic let id: Int
    @objc dynamic let online: Int
    @objc dynamic let photo50: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id
        case online
        case photo50 = "photo_50"
    }
}

struct MyFriendsResponse: Codable {
    let count: Int
    let items: [VKUser]
}

struct FriendsResponse: Codable {
    let response: MyFriendsResponse
}

class FriendsService {
    
    func loadFriendsData(completion: @escaping ([VKUser]) -> Void) {
        
        let realmm = try! Realm()
        print(realmm.configuration.fileURL!)
        
        AF.request("https://api.vk.com/method/friends.get",
                   parameters: [
                    "access_token" : Session.instance.token,
                    "user_id" : Session.instance.userId,
                    "fields" : "photo_50",
                    "v" : Session.instance.apiVersion
        ]).responseData { [weak self] response in
            
            do {
                let users = try JSONDecoder().decode(FriendsResponse.self, from: response.value!)
                self?.saveFriendsData(users.response.items)
                completion(users.response.items)
                print(users)
            } catch {
                print(error)
            }
        }
    }
    
    func saveFriendsData(_ friends: [VKUser]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(friends)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
