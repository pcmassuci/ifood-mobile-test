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
    var user: String  { get }
}

class MessageItemViewModel: MessageItemPresentable {
    var messageText: String
    var user: String
    
    init(message: Message) {
        self.messageText = message.messageText
        self.user = message.user
    }
}

protocol MessageViewDelegate {
    func onViewAtualize(newValue: String) -> ()
}

protocol MessageViewPresentable {
    var newMessageValue: String? { get }
}

class MessageViewModel: MessageViewPresentable {
    
    var newMessageValue: String?
    var items: [MessageItemPresentable] = []

    init() {
        let message1 = Message(messageText: "Hakuna Matata", user: "Timão")
        let message2 = Message(messageText: "Não é a mamãe", user: "Baby")
        let item1 = MessageItemViewModel(message: message1)
        let item2 = MessageItemViewModel(message: message2 )
        items.append(contentsOf: [item1, item2])
    }
}

extension MessageViewModel: MessageViewDelegate {
    func onViewAtualize(newValue: String) {
        
    }
}
