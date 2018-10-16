//
//  Person.swift
//  Nulp_App
//
//  Created by Olha Polishchuk on 24.09.2018.
//  Copyright © 2018 Olga. All rights reserved.
//

import Foundation

class Person: Codable {
    var firstName: String
    var secondName: String
    var phoneNumber: Int
    
    init(firstName : String, secondName : String,phoneNumber : Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.phoneNumber = phoneNumber
    }
    
    
    
}
