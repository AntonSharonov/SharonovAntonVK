//
//  User.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 06/04/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let avatar: UIImage
    let photoes: [UIImage]
}

final class FriendsMaker {
    static func makeFriends() -> [User] {
        let alex = User(name: "Alex White", avatar: UIImage(named: "alex1")!, photoes: [
            UIImage(named: "alex1")!,
            UIImage(named: "alex2")!,
            UIImage(named: "alex3")!,
            UIImage(named: "alex4")!,
        ])
        let bob = User(name: "Bob Brown", avatar: UIImage(named: "bob1")!, photoes: [
            UIImage(named: "bob1")!,
            UIImage(named: "bob2")!,
            UIImage(named: "bob3")!,
        ])
        let mark = User(name: "Mark Din", avatar: UIImage(named: "mark1")!, photoes: [
            UIImage(named: "mark1")!,
            UIImage(named: "mark3")!,
            UIImage(named: "mark4")!,
        ])
        let taylor = User(name: "Taylor Swift", avatar: UIImage(named: "swift1")!, photoes: [
            UIImage(named: "swift1")!,
            UIImage(named: "swift2")!,
            UIImage(named: "swift3")!,
        ])
        let mike = User(name: "Mike Lee", avatar: UIImage(named: "mike1")!, photoes: [
            UIImage(named: "mike1")!,
        ])
        let kate = User(name: "Kate Smith", avatar: UIImage(named: "kate1")!, photoes: [
            UIImage(named: "kate1")!,
            UIImage(named: "kate2")!,
        ])

        let users = [alex, bob, mark, taylor, mike, kate]
        return users
    }
}

