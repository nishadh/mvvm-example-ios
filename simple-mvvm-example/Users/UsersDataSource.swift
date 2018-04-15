//
//  UsersDataSource.swift
//  simple-mvvm-example
//
//  Created by Nishadh Shanker Shrestha on 15/04/18.
//  Copyright © 2018 Nishadh Shrestha. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String?
    let email: String?
}

protocol UsersDataSourceType {
    func fetchUsers(completion: @escaping (_ result: Result<[User]>) -> Void)
}

class UsersDataSource: UsersDataSourceType {

    func fetchUsers(completion: @escaping (_ result: Result<[User]>) -> Void) {
        NetworkClient.get(url: URL(string: "https://jsonplaceholder.typicode.com/users")!) { result in
            completion(result as Result<[User]>)
        }
    }

}
