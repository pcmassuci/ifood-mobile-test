//
//  UserViewModel.swift
//  TwitterApp
//
//  Created by Paulo Cesar Morandi Massuci on 25/06/19.
//  Copyright © 2019 Paulo Cesar Morandi Massuci. All rights reserved.
//

import Foundation

protocol UserItemPresentable {
    var name: String { get }
    var screenName: String  { get }
    var image: String { get }
}

class UserItemViewModel: UserItemPresentable {
    var image: String
    var name: String
    var screenName: String
    
    init(user: User) {
        self.name = user.name ?? ""
        self.screenName = user.screenName ?? ""
        self.image = user.profileImageUrl ?? ""
    }
}

protocol UserViewDelegate {
    func onViewAtualize(users: [User]) -> ()
}

protocol UserViewPresentable {
    var newUserValue: String? { get }
}

class UserViewModel: UserViewPresentable {
    var newUserValue: String?
    
    var items: [UserItemPresentable] = []
    
    init() {
    }
}

extension UserViewModel: UserViewDelegate {
  
    func onViewAtualize(users: [User]) {
        items.removeAll()
        for user in users {
            let item = UserItemViewModel(user: user)
            items.append(item)
        }
    }
}
