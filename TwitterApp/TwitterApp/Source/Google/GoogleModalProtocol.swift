//
//  GoogleModalProtocol.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 27/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol GoogleModalProtocol {
    
    func getSentiment(message: String, completion: @escaping (Sentiment) -> Void)
}

