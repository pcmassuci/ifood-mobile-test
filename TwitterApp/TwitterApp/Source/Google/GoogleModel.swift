//
//  GoogleModel.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 26/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class GoogleModel: GoogleModalProtocol {
    func getSentiment(message: String, completion: @escaping (Sentiment) -> Void) {
        let apiKey = "AIzaSyAsbl5vK66YRYS58skLk9PfVMRsm4YS3Gs"
        let urlString = "https://language.googleapis.com/v1/documents:analyzeSentiment?key=\(apiKey)"
        let url = URL(string: urlString)!
        
        let parameters =
            [ "document": [
                "type":"PLAIN_TEXT",
                "content": message ],
              "encodingType": "UTF8"] as [String : Any]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                guard let unwrapData = response.data else { return }
                do {
                    let jsonObjects = try JSON(data: unwrapData)
                    guard let dict = jsonObjects.dictionary,
                    let docsent = dict["documentSentiment"]?.dictionary,
                    let value = docsent["score"]?.double  else { return }
                    
                    if value > 0.5 {
                        completion(.happy)
                    } else if value < -0.5 {
                        completion(.angry)
                    } else {
                        completion(.none)
                    }
                } catch {
                    print("erro" )
                }
        }
    }
}


//curl "https://language.googleapis.com/v1/documents:analyzeSentiment?key=${API_KEY}" -s -X POST -H "Content-Type: application/json" --data-binary @request.json
