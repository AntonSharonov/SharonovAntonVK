//
//  VKFriends.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 20/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire

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

class FriendsService {
    
    func loadFriendsData(completion: @escaping ([VKUser]) -> Void) {
        
        AF.request("https://api.vk.com/method/friends.get",
                   parameters: [
                    "access_token" : Session.instance.token,
                    "user_id" : Session.instance.userId,
                    "fields" : "photo_50",
                    "v" : Session.instance.apiVersion
        ]).responseData { response in
            
            do {
                let users = try JSONDecoder().decode(FriendsResponse.self, from: response.value!)
                completion(users.response.items)
                print(users)
            } catch {
                print(error)
            }
        }
    }
}
