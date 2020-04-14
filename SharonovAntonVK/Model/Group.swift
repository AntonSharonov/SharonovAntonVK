//
//  Group.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 06/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct Group {
    let title: String
    let logo: UIImage
}

final class GroupMaker {
    
    static func makeGroups() -> [Group] {
        return [
            Group(title: "News", logo: UIImage(systemName: "tv")!),
            Group(title: "Sport", logo: UIImage(systemName: "sportscourt")!),
            Group(title: "Cinema", logo: UIImage(systemName: "film")!),
            Group(title: "Animals", logo: UIImage(systemName: "ant")!),
            Group(title: "Games", logo: UIImage(systemName: "gamecontroller")!),
            Group(title: "Education", logo: UIImage(systemName: "book")!),
            Group(title: "Cars", logo: UIImage(systemName: "car")!),
            Group(title: "COVID-19", logo: UIImage(systemName: "wifi.slash")!),
        ]
    }
}

