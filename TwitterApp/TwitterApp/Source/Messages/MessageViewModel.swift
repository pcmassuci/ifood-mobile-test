//
//  MessageViewModel.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol MessageItemPresentable {
    var messageText: String { get }
    var sentiment: Sentiment  { get }
}

class MessageItemViewModel: MessageItemPresentable {
    var sentiment: Sentiment
    var messageText: String
    
    init(message: Message) {
        messageText = message.messageText
        sentiment = message.sentiment
    }
}

protocol MessageViewDelegate {
    func onViewAtualize(messages: [Message]) -> ()
}

protocol MessageViewPresentable {
    var newMessageValue: String? { get }
}

class MessageViewModel: MessageViewPresentable {
    
    var newMessageValue: String?
    var items: [MessageItemPresentable] = []

    init() {
        let message = Message(messageText: "remember drink water")
        let item = MessageItemViewModel(message: message)
        items.append(item)
    }
}

extension MessageViewModel: MessageViewDelegate {
    func onViewAtualize(messages: [Message]) {
        items.removeAll()
        for message in messages {
            let item = MessageItemViewModel(message: message)
            items.append(item)
        }
    }
}
