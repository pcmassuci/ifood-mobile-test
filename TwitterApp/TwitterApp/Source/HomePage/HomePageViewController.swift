//
//  HomePageViewController.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import TwitterKit
import SwiftyJSON
import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var messagesTableview: UITableView?
    var viewModel: MessageViewModel?
    var accessToken: String! = ""
    
    struct Constants {
        static let identifier = "messageCellIdentifier"
        static let nibName = "MessageItemTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeTwitter))
        self.navigationItem.rightBarButtonItem = button
        
    
        messagesTableview?.dataSource = self
        
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        
        messagesTableview?.register(nib, forCellReuseIdentifier: Constants.identifier)
        viewModel = MessageViewModel()
        let client = TWTRAPIClient()
        let statusesShowEndpoint = "https://api.twitter./1.1/statuses.json"
        let params = ["id" : "20"]
        var clientError: NSError?
        
        let request = client.urlRequest(withMethod: "GET", urlString: statusesShowEndpoint, parameters: params, error: &clientError)
        client.sendTwitterRequest(request) { (response, data, connectionError) in
            print("error")
        }
        
        do {

        }
    }
}

extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as? MessageItemTableViewCell
        
        if let itemViewModel = viewModel?.items[indexPath.row] {
            cell?.configure(withViewModel: itemViewModel)
        }
        //criar célula de erro
        return cell ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension HomePageViewController {
    @objc
    private func composeTwitter() {
        let composer = TWTRComposer()
        composer.setText("Isso é um teste")
        composer.show(from: self) { (result) in
            if result == .cancelled {
                print("send twitter")
            } else {
                print("Cancel Twitter")

            }
        }
    }
}

extension HomePageViewController {
    
    func get() {
        
        let client = TWTRAPIClient()
        let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/show.json"
        let params = ["id": "20"]
        var clientError : NSError?
        
        let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
            if connectionError != nil {
                print("Error: \(connectionError)")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("json: \(json)")
            } catch let jsonError as NSError {
                print("json error: \(jsonError.localizedDescription)")
            }
        }    }
    
}
