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
        
        let news = Group(title: "News", logo: UIImage(systemName: "tv")!)
        let sport = Group(title: "Sport", logo: UIImage(systemName: "sportscourt")!)
        let cinema = Group(title: "Cinema", logo: UIImage(systemName: "film")!)
        let animals = Group(title: "Animals", logo: UIImage(systemName: "ant")!)
        let games = Group(title: "Games", logo: UIImage(systemName: "gamecontroller")!)
        let education = Group(title: "Education", logo: UIImage(systemName: "book")!)
        let cars = Group(title: "Cars", logo: UIImage(systemName: "car")!)
        let covid = Group(title: "COVID-19", logo: UIImage(systemName: "wifi.slash")!)
        
        let groups = [news, sport, cinema, animals, games, education, cars, covid]
        
        return groups
    }
}

