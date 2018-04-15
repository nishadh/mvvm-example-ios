//
//  UserItemModel.swift
//  simple-mvvm-example
//
//  Created by Nishadh Shanker Shrestha on 15/04/18.
//  Copyright © 2018 Nishadh Shrestha. All rights reserved.
//

import Foundation

struct UserItemModel {

    var name: String
    var email: String

    init(user: User) {
        name = user.name ?? ""
        email = user.email ?? ""
    }
    
}
