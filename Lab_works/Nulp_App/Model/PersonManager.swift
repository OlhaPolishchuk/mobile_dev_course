//
//  PersonManager.swift
//  Nulp_App
//
//  Created by Olha Polishchuk on 24.09.2018.
//  Copyright © 2018 Olga. All rights reserved.
//

import Foundation

class PersonManager {
    
    static func getPersons() -> [Person] {
        if let placeData = UserDefaults.standard.data(forKey: Constans.placesKey) {
            let placeArray = try? JSONDecoder().decode([Person].self, from: placeData)
            return placeArray!
        } else {
            return []
        }
    }
    
    static func submitDataWith(person: Person) {
        var persons: [Person] = []
        if isKeyPresentInUserDefaults() {
            persons = PersonManager.getPersons()
            persons.append(person)
            let placesData = try! JSONEncoder().encode(persons)
            UserDefaults.standard.removeObject(forKey: Constans.placesKey)
            UserDefaults.standard.set(placesData, forKey: Constans.placesKey)
            UserDefaults.standard.synchronize()
        } else if (isKeyPresentInUserDefaults() != true){
            persons.append(person)
            let placesData = try! JSONEncoder().encode(persons)
            UserDefaults.standard.set(placesData, forKey: Constans.placesKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    
    static func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: Constans.placesKey) != nil
    }
    
    static func crearData() {
        UserDefaults.standard.removeObject(forKey: Constans.placesKey)
    }
    
}

private extension PersonManager {
    enum Constans {
        static let placesKey = "places"
    }
}
