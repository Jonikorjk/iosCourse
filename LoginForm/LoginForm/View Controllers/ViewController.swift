//
//  ViewController.swift
//  LoginForm
//
//  Created by User on 17.10.2022.
//
import Foundation
import UIKit

extension UIButton {
    public func setEye(_ openEye: UIImage, _ closedEye: UIImage, _ textField: UITextField) {
        self.setImage(openEye, for: .normal)
        self.setImage(closedEye, for: .selected)
        self.imageEdgeInsets = UIEdgeInsets(top: 8, left: 1, bottom: 8, right: 15)
        textField.rightView = self
        textField.rightViewMode = .always
    }
}

class ViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var confirmPasswordLabel: UILabel!
    
    
    @IBOutlet var errConfirmPasswordLabel: UILabel!
    @IBOutlet var errPaswordLabel: UILabel!
    @IBOutlet var errEmailLabel: UILabel!
    
    var eyeButton = UIButton(type: .custom)
    @IBOutlet var nextButton: UIButton!
    
    
    
    var datasaver: DataSaverController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
        eyeButton.setEye(UIImage(named: "eye")!, UIImage(named: "closed_eye")!, passwordTextField)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func toPersonalInfoScene(_ sender: UIButton) {
        if let personalInfoVC = storyboard?.instantiateViewController(withIdentifier: "PersonalInfoViewController") as? PersonalInfoViewController {
            
//             cheking is the textfields are correct
            if !Validation.checkOnRegex(passwordTextField.text, type: .password) ||
               !Validation.checkOnRegex(emailTextField.text, type: .email)       ||
               !Validation.checkOnRegex(passwordTextField.text, type: .password) ||
               !Validation.isPasswordsSimillar(passwordTextField.text, confirmPasswordTextField.text) {
                changeCpassword("")
                changePasswordLabel("")
                changeEmailLabel("")
                return
            }
            
            datasaver = DataSaverController(data: User(email: emailTextField.text!, password: passwordTextField.text!))
            personalInfoVC.datasaver = datasaver
            
            self.navigationController?.pushViewController(personalInfoVC, animated: true)
        }
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
    
    @IBAction func changeCpassword(_ sender: Any) {
        if Validation.isPasswordsSimillar(passwordTextField.text, confirmPasswordTextField.text) {
            errConfirmPasswordLabel.isHidden = true
        }
        else {
            errConfirmPasswordLabel.isHidden = false
        }
    }
    
    @IBAction func changePasswordLabel(_ sender: Any) {
        if Validation.checkOnRegex(passwordTextField.text, type: .password) {
            errPaswordLabel.isHidden = true
        }
        else {
            errPaswordLabel.isHidden = false
        }
    }
    
    @IBAction func changeEmailLabel(_ sender: Any) {
        if Validation.checkOnRegex(emailTextField.text, type: .email) {
            errEmailLabel.isHidden = true
        }
        else {
            errEmailLabel.isHidden = false
        }
    }
}
