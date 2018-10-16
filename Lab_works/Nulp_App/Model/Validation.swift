//
//  ValidationController.swift
//  Nulp_App
//
//  Created by Olha Polishchuk on 24.09.2018.
//  Copyright © 2018 Olga. All rights reserved.
//

import Foundation
import UIKit

class Valiadtion {

    //MARK: Validation
    
    static func isValidNameIn(textField: UITextField) -> Bool {
        let firstNameRegex = "[a-zA-Z]{1,30}"
        let nameTest = NSPredicate(format: "SELF MATCHES %@", firstNameRegex)
        let result = nameTest.evaluate(with: textField.text)
        changeColor(textFieldName: textField, isvalid: result)
        return result
    }
    
    static func isValidSecondName(secondName: String?) -> Bool {
        let secondNameRegex = "[a-zA-Z]{1,30}"
        let secondNameTest = NSPredicate(format: "SELF MATCHES %@", secondNameRegex)
        let result = secondNameTest.evaluate(with: secondName)
//        changeColor(textFieldName: secondNameTextField, isvalid: result)
        return result
    }
    
    static func isValidEmail(emailAddressString: String) -> Bool{
        let emailRegex = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let result = emailTest.evaluate(with: emailAddressString)
//        changeColor(textFieldName: emailTextField, isvalid: result)
        return result
    }
    
    static func isValidPhone(number: String) -> Bool{
        let phoneRegex = "^((\\+){0,1})[0-9]{6,14}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result = phoneTest.evaluate(with: number)
//        changeColor(textFieldName: phoneTextField, isvalid: result)
        return result
    }
    
    static func isValidPassword(password: String) -> Bool{
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,20}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let result = passwordTest.evaluate(with: password)
//        changeColor(textFieldName: passwordTextField, isvalid: result)
        return result
    }
    
    static func isPasswordSame(password: String, confirmPassword: String) -> Bool{
        var result:Bool = true
        if password == confirmPassword {
            result = true
        } else {
//            changeColor(textFieldName: confirmPasswordTextField, isvalid: result)
        }
        return result
    }
    
    
    static func changeColor(textFieldName: UITextField, isvalid: Bool) {
        textFieldName.layer.borderWidth = 0.8
        textFieldName.layer.cornerRadius = 5.0
        if isvalid {
            textFieldName.layer.borderColor = UIColor.clear.cgColor
        } else {
            textFieldName.layer.borderColor = UIColor.red.cgColor
        }
    }
}
