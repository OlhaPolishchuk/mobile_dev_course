import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Private properties
    
    @IBOutlet fileprivate weak var firstNameTextField: UITextField!
    @IBOutlet fileprivate weak var secondNameTextField: UITextField!
    @IBOutlet fileprivate weak var emailTextField: UITextField!
    @IBOutlet fileprivate weak var phoneTextField: UITextField!
    @IBOutlet fileprivate weak var passwordTextField: UITextField!
    @IBOutlet fileprivate weak var confirmPasswordTextField: UITextField!
    
    
    @IBOutlet fileprivate weak var listButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - IBAction
    
    @IBAction func sayButton(_ sender: UIButton) {
        sendDataifValid();
    }
}

// MARK: - Private

private extension BaseViewController {
    
    func configureUI() {
//        for (_, textField) in textFieldsCollection.enumerated() {
//            textField.layer.borderWidth = 0.8
//            textField.layer.cornerRadius = 5.0
//        }
    }
    
    func sendDataifValid() {
        if (Valiadtion.isValidNameIn(textField: firstNameTextField) &&
            Valiadtion.isValidSecondName(secondName: secondNameTextField.text) &&
            Valiadtion.isValidEmail(emailAddressString: emailTextField.text!) &&
            Valiadtion.isValidPhone(number: phoneTextField.text!) &&
            Valiadtion.isValidPassword(password: passwordTextField.text!) &&
            Valiadtion.isPasswordSame(password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!)) == true {
            let person = Person(firstName : firstNameTextField.text!, secondName : secondNameTextField.text! ,phoneNumber : Int(phoneTextField.text! )!)
            PersonManager.submitDataWith(person: person)
            listButton.sendActions(for: .touchUpInside);
        }
    }
}
