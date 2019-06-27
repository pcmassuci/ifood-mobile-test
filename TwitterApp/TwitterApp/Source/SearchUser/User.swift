//
//  User.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 24/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: String?
    let name: String?
    let screenName: String?
    let profileImageUrl: String?
    
    init(id: String?, name: String?, screenName: String?, profileImageUrl: String?) {
        self.id = id
        self.name = name
        self.screenName = screenName
        self.profileImageUrl = profileImageUrl
    }
}

