//
//  MessageTableViewCell.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class MessageItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var messageLabel: UILabel?
    @IBOutlet private weak var emoticon: UILabel?


    func configure(withViewModel viewModel: MessageItemPresentable) -> (Void) {
        messageLabel?.text = viewModel.messageText
        switch viewModel.sentiment {
        case .happy:
            backgroundColor = .yellow
            emoticon?.text = "😃"
            messageLabel?.textColor = .gray

        case .sad:
            backgroundColor = .blue
            emoticon?.text = "😔"
            messageLabel?.textColor = .white
            
        case .neutral:
            backgroundColor = .gray
            emoticon?.text = "😐"
            messageLabel?.textColor = .white

        }
    }
}
