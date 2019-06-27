//
//  TwitterManager .swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 19/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import TwitterKit
import SwiftyJSON

class TwitterModel: TwitterModelProtocol {
    
    lazy var client = TWTRAPIClient.withCurrentUser()
    private struct ApiRoutes {
        static let UserTimeline = "https://api.twitter.com/1.1/statuses/user_timeline.json"
        static let UserSearch = "https://api.twitter.com/1.1/users/search.json"
    }
    
    func findUsers(fromString string: String, completion: @escaping UserCompletion) {
        var users: [User] = []
        let params = ["q":"\(string)", "exclude_replies": "true"]
        var error: NSError?
        let req = client.urlRequest(withMethod: "GET", urlString: ApiRoutes.UserSearch, parameters: params, error: &error)
        
        client.sendTwitterRequest(req, completion: { response, data, error in
            if error == nil {
                guard let unwrapData = data else { return }
                
                do {
                    let jsonObjects = try JSON(data: unwrapData)
                    for jsonObjbect in jsonObjects {
                        guard let dict = jsonObjbect.1.dictionary else { return }
                        let name: String? = dict["name"]?.string ?? ""
                        let id: String? = dict["id"]?.string ?? ""
                        let imageUrl: String? = dict["profile_image_url"]?.string ?? ""
                        let screenName: String? = dict["screen_name"]?.string ?? ""
                        let user = User(id: id, name: name, screenName: screenName, profileImageUrl: imageUrl)
                        users.append(user)
                    }
                } catch {
                    print("erro" )
                }
                completion(users, error)
            }
        })
    }
    
    func getTimeline(fromUser user: String, completion: @escaping MessagesCompletion) {
        var messages: [Message] = []
        let parameters = ["screen_name": "\(user)", "count": "10"]
        var error: NSError?
        
        let req = client.urlRequest(withMethod: "GET", urlString: ApiRoutes.UserTimeline, parameters: parameters, error: &error)
        
        client.sendTwitterRequest(req, completion: { response, data, error in
            if error == nil {
                guard let unwrapData = data else { return }
                
                do {
                    let jsonObjects = try JSON(data: unwrapData)
                    for jsonObjbect in jsonObjects {
                        guard let dict = jsonObjbect.1.dictionary else { return }
                        let txt: String? = dict["text"]?.string ?? ""
                        let message = Message(messageText: txt!)
                        messages.append(message)
                    }
                } catch {
                    print("erro" )
                }
                completion(messages, error)
            }
        })
    }
}
