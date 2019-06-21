//
//  MessageModel.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import UIKit

struct Message {
    var messageText: String
    var user: String
//    var image: UIImage
    
    init(messageText: String, user: String) {
        self.messageText = messageText
        self.user = user
    }
    
}
