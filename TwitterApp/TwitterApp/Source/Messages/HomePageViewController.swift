//
//  HomePageViewController.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import TwitterKit
import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var messagesTableview: UITableView?
    private lazy var twitterModel: TwitterModelProtocol =  TwitterModel()
    private lazy var sentimentModel: GoogleModalProtocol =  GoogleModel()

    private var screenName: String?
    
    var viewModel: MessageViewModel?
    
    struct Constants {
        static let identifier = "messageCellIdentifier"
        static let nibName = "MessageItemTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }

    private func setupViewDidLoad() {
        messagesTableview?.dataSource = self
        messagesTableview?.rowHeight = UITableView.automaticDimension
        messagesTableview?.estimatedRowHeight = 100
        messagesTableview?.tableFooterView = UIView(frame: .zero)

        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        messagesTableview?.register(nib, forCellReuseIdentifier: Constants.identifier)
        viewModel = MessageViewModel()
        guard let sName = screenName else { return }
        
        fetchData(fromUser: sName)
    }
    
    func setup(WithScreenName screenName: String) {
        self.screenName = screenName
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
    
    func fetchData(fromUser user: String) {
        MessageAnalizeModel().getSentimentMessages(user: user) { messages in
            self.viewModel?.onViewAtualize(messages: messages)
            self.messagesTableview?.reloadData()
        }
    }
}
