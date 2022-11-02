//
//  StartViewController.swift
//  LoginForm
//
//  Created by User on 01.11.2022.
//

import UIKit

class StartViewController: UIViewController {

    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var email_lbl: UILabel!
    @IBOutlet var password_lbl: UILabel!

    @IBOutlet var errNoSuchUserLabel: UILabel!
    
    @IBOutlet var errInvalidEmail: UILabel!
    @IBOutlet var errInvlidPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errNoSuchUserLabel.isHidden = true
        errInvalidEmail.isHidden = true
        errInvlidPassword.isHidden = true
    }
    

    @IBAction func toWelcomeScene(_ sender: UIButton) {
                
        if let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") {
            
            guard let storage = UserDefaults.standard.array(forKey: "Users") as? [Dictionary<String,String>] else {
                errNoSuchUserLabel.isHidden = false
                emailTextField.text = ""; passwordTextField.text = ""
                return
            }
            
            for itterator in storage {
                if (itterator["login"] == emailTextField.text) {
                    if (itterator["password"] == passwordTextField.text) {
                        self.navigationController?.pushViewController(welcomeVC, animated: true)
                        return
                    }
                }
            }
            errNoSuchUserLabel.isHidden = false
            emailTextField.text = ""; passwordTextField.text = ""
        }
    }
    
    @IBAction func changeEmail (_ sender: Any) {
        if Validation.checkOnRegex(emailTextField.text, type: .email) {
            errInvalidEmail.isHidden = true
        }
        else {
            errInvalidEmail.isHidden = false
        }
        errNoSuchUserLabel.isHidden = true

    }
    
    @IBAction func changePassword(_ sender: Any) {
        if Validation.checkOnRegex(passwordTextField.text, type: .password) {
            errInvlidPassword.isHidden = true
        }
        else {
            errInvlidPassword.isHidden = false
        }
        errNoSuchUserLabel.isHidden = true
    }
}
