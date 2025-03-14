//
//  MessageModel.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import UIKit

enum Sentiment {
    case neutral
    case happy
    case sad
}

struct Message {
    var messageText: String
    var sentiment: Sentiment
    
    init(messageText: String) {
        self.messageText = messageText
        sentiment = .neutral
    }
}
