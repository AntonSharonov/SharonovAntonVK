//
//  Session.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 10/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

let baseScheme = "https"
let baseHost = "api.vk.com"

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var token = ""
    var userId = 0
    let apiVersion = "5.107"
}
