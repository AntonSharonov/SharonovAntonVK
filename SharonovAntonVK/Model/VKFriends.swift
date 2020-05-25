//
//  VKFriends.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 20/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct VKUser: Codable {
    let firstName: String
    let lastName: String
    let id: Int
    let online: Int
    let photo50: String
    
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
