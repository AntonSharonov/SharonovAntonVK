//
//  VKFriends.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 20/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct FriendsResponse: Decodable {
    let response: Response
    
    
    struct Response: Decodable {
        let items: [VKFriends]
    }
    
    struct VKFriends: Decodable {
        let id: Int
        let firstName: String
        let lastName: String
        let avatar: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar = "photo_50"
        }
    }
}

