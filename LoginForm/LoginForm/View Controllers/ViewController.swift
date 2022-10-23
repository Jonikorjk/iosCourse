//
//  ViewController.swift
//  LoginForm
//
//  Created by User on 17.10.2022.
//
import Foundation
import UIKit

//func doStringContainsNumber( _string : String) -> Bool{
//
//        let numberRegEx  = ".*[0-9]+.*"
//        let testCase = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
//    let containsNumber = testCase.evaluate(with: _string)
//
//        return containsNumber
//        }

class ViewController: UIViewController {
    @IBOutlet var email_lbl: UITextField!
    @IBOutlet var password_lbl: UITextField!
    @IBOutlet var confirm_password_lbl: UITextField!
    
    var eye = UIButton(type: .custom)
    
    var datasaver: DataSaverController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eye.setImage(UIImage(named: "eye"), for: .normal)
        eye.setImage(UIImage(named: "closed_eye"), for: .selected)
        eye.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        eye.imageEdgeInsets = UIEdgeInsets(top: 8, left: 1, bottom: 8, right: 15)
        password_lbl.rightView = eye
        password_lbl.rightViewMode = .always
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PersonalInfoSegue" {
            //TODO: add validation func on textfields before segue (VC)

            if let destinationVC = segue.destination as? PersonalInfoViewController {
                datasaver = DataSaverController(data: User(email: email_lbl.text!, password: password_lbl.text!))
                destinationVC.datasaver = datasaver
            }
        }
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        password_lbl.isSecureTextEntry.toggle()
        eye.isSelected.toggle()
    }
    

    
    
    
    
    
}

