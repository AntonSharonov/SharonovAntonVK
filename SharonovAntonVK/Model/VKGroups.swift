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
        
        AF.request("https://api.vk.com/method/groups.get",
                          parameters: [
                           "access_token" : Session.instance.token,
                           "user_id" : Session.instance.userId,
                           "extended" : "1",
                           "v" : Session.instance.apiVersion
               ]).responseData { response in
            
            do {
                let groups = try JSONDecoder().decode(GroupsResponse.self, from: response.value!)
                completion(groups.response.items)
            } catch {
                print(error)
            }
        }
    }
}
