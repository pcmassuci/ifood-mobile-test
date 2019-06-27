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
    @IBOutlet private weak var userName: UILabel?
    @IBOutlet private weak var ematicon: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withViewModel viewModel: MessageItemPresentable) -> (Void) {
        messageLabel?.text = viewModel.messageText
        switch viewModel.sentiment {
        case .happy:
            backgroundColor = .yellow
        case .angry:
            backgroundColor = .red
        default:
            backgroundColor = .white
        }
    }
}
