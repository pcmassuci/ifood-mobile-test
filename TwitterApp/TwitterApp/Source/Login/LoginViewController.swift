//
//  LoginViewController.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 20/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit
import TwitterKit
import TwitterCore

class LoginViewController: UIViewController {
    var tweetView: TWTRTweetView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if session != nil {
                self.performSegue(withIdentifier: Segues.loginToHomePage, sender: nil)
            } else {
                let _ = error?.localizedDescription ?? "unknown"
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
    }
    
    func beforeLogin() {
        
        //        let client = TWTRAPIClient()
        //        let ab = TWTRUserTimelineDataSource(screenName: "", apiClient: client)
        //
        //        client.loadTweet(withID: ab.apiClient.userID!) { [weak self] (tweet, error) in
        //            guard let self = self else { return }
        //            if let t = tweet {
        //                if let tweetView = self.tweetView {
        //                    tweetView.configure(with: t)
        //                } else {
        //                    self.tweetView = TWTRTweetView(tweet: t, style: TWTRTweetViewStyle.regular)
        //                }
        //            } else {
        //                print("Failed to load Tweet:)")
        //            }
        //        }
            }
    
}
