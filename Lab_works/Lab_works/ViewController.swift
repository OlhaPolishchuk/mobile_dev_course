//
//  ViewController.swift
//  Lab_works
//
//  Created by Olha Polishchuk on 07.09.18.
//  Copyright © 2018 Olga. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBAction func action(_ sender: UIButton) {
    var emptyFields = ""
    var passwordsMatch = ""
    var validationEmail = ""
    var validationPhone = ""
    var validationPassword = ""
        // Validate required fields are not empty
        if(txtFirstName.text?.isEmpty)! || (txtLastName.text?.isEmpty)! || (txtEmail.text?.isEmpty)! || (txtPhoneNumber.text?.isEmpty)! ||  (txtPassword.text?.isEmpty)! || (txtConfirmPassword.text?.isEmpty)!
        {
            emptyFields = "All fields must be filled out.\n"
        }
        
        // Validate password
        if((txtPassword.text?.elementsEqual(txtConfirmPassword.text!))! != true)
        {
            passwordsMatch = "Your passwords do not match.\n"
        }
        
        if isValidEmail(emailID: txtEmail.text!) == false {
            validationEmail = "Your email is invalid.\n"
        }
        
        if isValidPhoneNumber(phoneID: txtPhoneNumber.text!) == false {
            validationPhone = "Your phone number is invalid.\n"
        }
        
        if (txtPassword.text!.count < 8) {
            validationPassword = "Your password is too short.\n"
        }
        output.text = emptyFields + validationEmail + validationPhone + validationPassword + passwordsMatch
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtEmail.delegate = self
        txtPhoneNumber.delegate = self
        txtPassword.delegate = self
        txtConfirmPassword.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Email validation
    func isValidEmail(emailID: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }

    // Phone Number validation
    func isValidPhoneNumber(phoneID: String) -> Bool {
        let phoneRegEx = "(0)+[0-9]{9}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: phoneID)
    }
}

