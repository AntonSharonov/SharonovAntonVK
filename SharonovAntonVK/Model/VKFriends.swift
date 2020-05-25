//
//  VKFriends.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 20/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct VKUser: Codable {
    let first_name: String
    let last_name: String
    let id: Int
    let online: Int
    
//    init(json: [String: Any]) {
//        self.first_name = json["first_name"] as! String
//        self.last_name = json["last_name"] as! String
//        self.id = json["id"] as! Int
//        self.online = json["online"] as! Int
//    }
}

struct Response: Codable {
    let count: Int
    let items: [VKUser]
}

struct FriendsResponse: Codable {
    let response: Response
}
