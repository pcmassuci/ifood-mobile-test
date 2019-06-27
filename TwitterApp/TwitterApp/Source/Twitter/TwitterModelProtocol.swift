//
//  TwitterManagerProtocol.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 19/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

typealias UserCompletion = ([User], Error?) -> Void
typealias MessagesCompletion = ([Message], Error?) -> Void

protocol TwitterModelProtocol {
    
    /// Find users
    ///
    /// - Parameters:
    ///   - string: String with name ou partial name
    ///   - completion: Return users or error
    func findUsers(fromString string: String, completion:@escaping UserCompletion )

    /// Get user's timeline
    ///
    /// - Parameters:
    ///   - user: String with screen name of user
    ///   - completion: Return MessagesModel or error
    func getTimeline(fromUser user: String, completion:@escaping MessagesCompletion)
}
