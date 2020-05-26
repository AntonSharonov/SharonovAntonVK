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


//{
//response =     {
//    count = 14337;
//    items =         (
//                    {
//            id = 14479721;
//            "is_admin" = 0;
//            "is_advertiser" = 0;
//            "is_closed" = 0;
//            "is_member" = 0;
//            name = "\U25ba W.S.clan. - \U041e\U0444\U0438\U0446\U0438\U0430\U043b\U044c\U043d\U0430\U044f \U0433\U0440\U0443\U043f\U043f\U0430";
//            "photo_100" = "https://sun9-30.userapi.com/c10077/g14479721/d_1c960abf.jpg?ava=1";
//            "photo_200" = "https://sun9-30.userapi.com/c10077/g14479721/d_1c960abf.jpg?ava=1";
//            "photo_50" = "https://sun9-30.userapi.com/c10077/g14479721/e_97814b75.jpg?ava=1";
//            "screen_name" = club14479721;
//            type = group;
//        },
//                    {
//            id = 13258537;
//            "is_admin" = 0;
//            "is_advertiser" = 0;
//            "is_closed" = 0;
