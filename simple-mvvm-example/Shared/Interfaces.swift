//
//  Interfaces.swift
//  simple-mvvm-example
//
//  Created by Nishadh Shanker Shrestha on 15/04/18.
//  Copyright © 2018 Nishadh Shrestha. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func willLoadData()
    func didLoadData()
}

protocol ViewModelType {
    func bootstrap()
    var delegate: ViewModelDelegate? { get set }
}
