//
//  WithouUserTableViewCell.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 26/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class WithouUserTableViewCell: UITableViewCell {
    @IBOutlet weak var warningLabel: UILabel?
    
    func setupCell() {
        setupDefinitions()
    }
    
}

extension WithouUserTableViewCell: DefinitionsOfView {
    func defineColors() {
        warningLabel?.textColor = .black
    }
    func defineProperties() {
        warningLabel?.text = "Sorry. Could not find a user :("
    }
}
