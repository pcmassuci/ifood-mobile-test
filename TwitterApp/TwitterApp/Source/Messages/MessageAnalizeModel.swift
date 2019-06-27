//
//  MessageAnalizeModel.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 27/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

class MessageAnalizeModel {
    private lazy var twitterModel: TwitterModelProtocol =  TwitterModel()
    private lazy var sentimentModel: GoogleModalProtocol =  GoogleModel()
    
    func getSentimentMessages(user: String, completion: @escaping ([Message]) -> Void) {
        let group = DispatchGroup()
        let queue = DispatchQueue.main
        
        var array: [Message] = []
        
        
        group.enter()
        queue.async(group: group) {
            self.twitterModel.getTimeline(fromUser: user, completion: { (messages, error) in
                let count = (messages.count - 1)
                for (index, message) in messages.enumerated() {
                    self.sentimentModel.getSentiment(message: message.messageText, completion: { sentiment in
                        var item = message
                        item.sentiment = sentiment
                        array.append(item)
                        if index == count {
                            group.leave()
                        }
                    })
                }
            })
        }
        
        group.notify(queue: queue) {
            completion(array)
        }
    }    
}
