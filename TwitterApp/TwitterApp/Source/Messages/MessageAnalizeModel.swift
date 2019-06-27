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
        
        var array: [Message] = []
//        let dispatch = DispatchGroup()
//        dispatch.enter()
        twitterModel.getTimeline(fromUser: user) { messages, error in
            array.append(contentsOf: messages)
            for (index, message) in array.enumerated() {
                self.sentimentModel.getSentiment(message: message.messageText, completion: { sentiment in
                    array[index].sentiment = sentiment
                })
            }
            completion(array)
        }
    }
    
    
   
}
