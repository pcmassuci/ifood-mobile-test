//
//  UserViewCellTableViewCell.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 25/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class UserViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var screenName: UILabel?
    @IBOutlet private weak var userName: UILabel?
    @IBOutlet private var profileImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(withViewModel viewModel: UserItemPresentable) -> (Void) {
        screenName?.text = viewModel.screenName
        userName?.text = viewModel.name
        setupDefinitions()
    }
}

extension UserViewCellTableViewCell: DefinitionsOfView {
    func defineFonts() {
        
    }
    
    func defineColors() {

    }
}
