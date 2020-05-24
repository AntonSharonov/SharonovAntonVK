//
//  VKFriends.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 20/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct VKUser {
    let first_name: String
    let last_name: String
    let id: Int
    let online: Int
    
    init(json: [String: Any]) {
        self.first_name = json["first_name"] as! String
        self.last_name = json["last_name"] as! String
        self.id = json["id"] as! Int
        self.online = json["online"] as! Int
    }
}

struct Response {
    let count: Int
    let items: [VKUser]
}

struct FriendsResponse {
    let response: Response
}


//struct FriendsResponse: Decodable {
//    let response: Response
//
//
//    struct Response: Decodable {
//        let items: [VKFriends]
//    }
//
//    struct VKFriends: Decodable {
//        let id: Int
//        let firstName: String
//        let lastName: String
//        let avatar: String?
//
//        enum CodingKeys: String, CodingKey {
//            case id
//            case firstName = "first_name"
//            case lastName = "last_name"
//            case avatar = "photo_50"
//        }
//    }
//}
//
