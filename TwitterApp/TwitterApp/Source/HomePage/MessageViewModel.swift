//
//  MessageViewModel.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol MessageItemPresentable {
    var messageText: String? { get }
    var user: String?  { get }
}

struct MessageItemViewModel: MessageItemPresentable {
    var messageText: String? = "0"
    var user: String?
}

protocol MessageItemViewDelegate {
    func onViewAtualize() -> ()
}
struct MessageViewModel {
    init() {
        let item1 = MessageItemViewModel(messageText: "Hue Hue", user: "Br")
        let item2 = MessageItemViewModel(messageText: "hakuna matata", user: "Timão")
        items.append(contentsOf: [item1, item2])
    }
    var newItem: String?
    var items: [MessageItemPresentable] = []
}

extension MessageViewModel: MessageItemViewDelegate {
    func onViewAtualize() {

    }
    
}
