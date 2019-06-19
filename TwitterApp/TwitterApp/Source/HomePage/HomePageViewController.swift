//
//  HomePageViewController.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 18/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet weak var messagesTableview: UITableView?
    var viewModel: MessageViewModel?
    
    struct Constants {
        static let identifier = "messageCellIdentifier"
        static let nibName = "MessageItemTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTableview?.dataSource = self
        
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        
        messagesTableview?.register(nib, forCellReuseIdentifier: Constants.identifier)
        viewModel = MessageViewModel()
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
