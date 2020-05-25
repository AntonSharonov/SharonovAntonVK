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
    
    //    enum MyFriendsKeys: String, CodingKey {
    //        case count
    //        case items
    //    }
    //
    //    enum FriendsKeys: String, CodingKey {
    //        case response
    //    }
    
    //    init(from decoder: Decoder) throws {
    //        let values = try decoder.container(keyedBy: CodingKeys.self)
    //        self.firstName = try values.decode(String.self, forKey: .firstName)
    //        self.lastName = try values.decode(String.self, forKey: .lastName)
    //        self.id = try values.decode(Int.self, forKey: .id)
    //        self.online = try values.decode(Int.self, forKey: .online)
    //        self.photo50 = try values.decode(String.self, forKey: .photo50)
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
    
    func loadFriendsData(completion: @escaping ([VKUser]) -> Void) {
        
        var urlConstructor = URLComponents()
        
        urlConstructor.scheme = baseScheme
        urlConstructor.host = baseHost
        urlConstructor.path = "/method/friends.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_id", value: "\(Session.instance.userId)"),
            URLQueryItem(name: "fields", value: "photo_50"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: Session.instance.apiVersion),
        ]
        
        AF.request(urlConstructor.url!).responseData { response in
            
            do {
                let users = try JSONDecoder().decode(FriendsResponse.self, from: response.value!)
                completion(users.response.items)
            } catch {
                print(error)
            }
        }
    }
}
