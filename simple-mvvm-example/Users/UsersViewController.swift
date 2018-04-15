//
//  ViewController.swift
//  simple-mvvm-example
//
//  Created by Nishadh Shanker Shrestha on 15/04/18.
//  Copyright © 2018 Nishadh Shrestha. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    private var model: UsersViewModelType!
    static func create(model: UsersViewModelType) -> UsersViewController {
        let storyboard = UIStoryboard(name: "UsersViewController", bundle: Bundle(for: UsersViewController.self))
        let vc = storyboard.instantiateInitialViewController() as! UsersViewController
        vc.model = model
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        model.delegate = self
        model.bootstrap()
    }

}

extension UsersViewController: ViewModelDelegate {

    func willLoadData() {
        activityIndicator?.startAnimating()
    }

    func didLoadData() {
        tableView.reloadData()
        activityIndicator?.stopAnimating()
    }

}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sections[section].name
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let user = model.sections[indexPath.section].rows[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        return cell
    }

}

