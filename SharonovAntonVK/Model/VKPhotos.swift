//
//  VKPhotos.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 25/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct PhotoSizes: Codable {
    let url: String
    let type: String
}

struct VKPhoto: Codable {
    let owner_id: Int
    let sizes: [PhotoSizes]
}

struct FriendsPhotosResponse: Codable {
    let count: Int
    let items: [VKPhoto]
}

struct PhotosResponse: Codable {
    let response: FriendsPhotosResponse
}
