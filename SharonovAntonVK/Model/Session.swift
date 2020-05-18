//
//  Session.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 10/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit

class Session {
    
    static let instance = Session()
    
    private init(){}
    
    var token = ""
    var userId = 0
}
