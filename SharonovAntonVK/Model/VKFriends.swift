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
    let photo_50: String
}

struct MyFriendsResponse: Codable {
    let count: Int
    let items: [VKUser]
}

struct FriendsResponse: Codable {
    let response: MyFriendsResponse
}
