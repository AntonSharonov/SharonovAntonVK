//
//  VKGroups.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 25/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import Alamofire

struct VKGroup: Codable {
    let id: Int
    let name: String
    let photo50: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo50 = "photo_50"
    }
}

struct MyGroupsResponse: Codable {
    let count: Int
    let items: [VKGroup]
}

struct GroupsResponse: Codable {
    let response: MyGroupsResponse
}

class GroupService {
    
    func loadGroupsData(completion: @escaping ([VKGroup]) -> Void) {
        
        var urlConstructor = URLComponents()
        
        urlConstructor.scheme = baseScheme
        urlConstructor.host = baseHost
        urlConstructor.path = "/method/groups.get"
        urlConstructor.queryItems = [
            URLQueryItem(name: "user_ids", value: "\(Session.instance.userId)"),
            URLQueryItem(name: "extended", value: "1"),
            URLQueryItem(name: "access_token", value: Session.instance.token),
            URLQueryItem(name: "v", value: Session.instance.apiVersion),
        ]
        
        AF.request(urlConstructor.url!).responseData { response in
            
            do {
                let groups = try JSONDecoder().decode(GroupsResponse.self, from: response.value!)
                completion(groups.response.items)
            } catch {
                print(error)
            }
            
        }
    }
}
