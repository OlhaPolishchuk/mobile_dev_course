//
//  TableVCViewController.swift
//  Nulp_App
//
//  Created by Olha Polishchuk on 24.09.2018.
//  Copyright © 2018 Olga. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

}

// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placesArray = PersonManager.getPersons()
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonTableViewCell.self), for: indexPath) as! PersonTableViewCell
        
        let placesArray = PersonManager.getPersons()
        let person = placesArray[indexPath.row]
        cell.configureWith(person: person)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
}

