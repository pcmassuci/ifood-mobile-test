//
//  TwitterManager .swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 19/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

class TwitterManager: TwitterManagerProtocol {
    
    var business: TwitterBusinessProtocol
    
    init(business: TwitterBusinessProtocol = TwitterBusiness()) {
        self.business = business
    }
}
