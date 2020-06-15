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
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    @objc dynamic var id: Int
    @objc dynamic var online: Int
    @objc dynamic var photo50: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id
        case online
        case photo50 = "photo_50"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
//    override static func ignoredProperties() -> [String] {
//        return ["photo50", "online"]
//    }
}

struct MyFriendsResponse: Codable {
    let count: Int
    let items: [VKUser]
}

struct FriendsResponse: Codable {
    let response: MyFriendsResponse
}

class FriendsService {
    
    func loadFriendsData(completion: @escaping () -> Void) {
        
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
                completion()
//                print(users)
            } catch {
                print(error)
            }
        }
    }
    
    func saveFriendsData(_ friends: [VKUser]) {
        
//        let realm = try! Realm()
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        let realm = try! Realm(configuration: config)
        print(realm.configuration.fileURL!)
        
        do {
//            let realm = try Realm()
            realm.beginWrite()
            
            realm.add(friends, update: .modified)
            
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
