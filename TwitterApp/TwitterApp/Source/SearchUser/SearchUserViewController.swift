//
//  SearchUserViewController.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 25/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import UIKit

class SearchUserViewController: UIViewController {
    @IBOutlet weak private var usersTableView: UITableView?
    @IBOutlet weak private var seachView: UISearchBar!
    private lazy var twitterModel: TwitterModelProtocol = TwitterModel()
    
    var viewModel: UserViewModel?
    
    struct Constants {
        static let identifier = "userCellIdentifier"
        static let withoutUserIdentifier = "withouUserCellIdentifier"
        static let nibName = "UserViewCellTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    private func setupViewDidLoad() {
        usersTableView?.dataSource = self
        usersTableView?.delegate = self
        let nib = UINib(nibName: Constants.nibName, bundle: nil)
        usersTableView?.register(nib, forCellReuseIdentifier: Constants.identifier)
        viewModel = UserViewModel()
        seachView.delegate = self
        usersTableView?.separatorStyle = .none
        self.navigationController?.navigationBar.backgroundColor = .navy
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .blackTranslucent
        seachView.backgroundColor = .navy
        navigationItem.setHidesBackButton(true, animated:true)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let string = sender as? String
        let destinationVC = segue.destination as? HomePageViewController
        guard let sName = string else { return }
        destinationVC?.setup(WithScreenName: sName)
    }

}

extension SearchUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let itemViewModel = viewModel?.items[indexPath.row] {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.identifier, for: indexPath) as? UserViewCellTableViewCell
          
            cell?.configure(withViewModel: itemViewModel)
            
            return cell ?? UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.withoutUserIdentifier) as? WithouUserTableViewCell
        
        return cell ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension SearchUserViewController {
    func atualizeTab(user: String) {
        twitterModel.findUsers(fromString: user) { users, error in
            if error == nil {
                self.viewModel?.onViewAtualize(users: users)
                self.usersTableView?.reloadData()
            }
        }
    }
}

extension SearchUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemViewModel = viewModel?.items[indexPath.row]
        
        performSegue(withIdentifier: "userToMessages", sender: itemViewModel?.screenName)
        
    }
}

extension SearchUserViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard var string = searchBar.text else { return }
        if string.last == "\\" {
        string = string.replacingOccurrences(of: "\\", with: "")
            searchBar.text = string
            return
        }
        string = string.replacingOccurrences(of: " ", with: "%20")
        if string.count > 3 {
            atualizeTab(user: string)
        }
    }
}
