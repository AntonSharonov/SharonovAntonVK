//
//  VKGroups.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 25/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct VKGroup: Codable {
    let id: Int
    let name: String
    let photo_50: String
}

struct MyGroupsResponse: Codable {
    let count: Int
    let items: [VKGroup]
}

struct GroupsResponse: Codable {
    let response: MyGroupsResponse
}

