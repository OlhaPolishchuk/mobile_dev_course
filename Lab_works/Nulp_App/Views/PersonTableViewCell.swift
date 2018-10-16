//
//  TableTableViewCell.swift
//  Nulp_App
//
//  Created by Olha Polishchuk on 16.09.2018.
//  Copyright © 2018 Olga. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var secondNameLabel: UILabel!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        firstNameLabel.text = ""
        secondNameLabel.text = ""
        phoneNumberLabel.text = ""
    }
    
    // MARK: - Public
    
    func configureWith(person: Person) {
        firstNameLabel.text = "Name: \(person.firstName)"
        secondNameLabel.text = "Second Name: \(person.secondName)"
        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
    }

}
