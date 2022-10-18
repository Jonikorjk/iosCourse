//
//  ViewController.swift
//  LoginForm
//
//  Created by User on 17.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var ConfPassword: UITextField!

    // buttons
    @IBOutlet var button: UIButton!
    var eye = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eye.setImage(UIImage(named: "eye"), for: .normal)
        eye.setImage(UIImage(named: "closed_eye"), for: .selected)
        eye.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        eye.imageEdgeInsets = UIEdgeInsets(top: 8, left: 1, bottom: 8, right: 15)
        password.rightView = eye
        password.rightViewMode = .always
    }

    @IBAction func pressButton(_ sender: UIButton) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "PersonalInfoViewController")
        navigationController?.pushViewController(newVC!, animated: true)
//        present(newVC!, animated: true)

    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        password.isSecureTextEntry.toggle()
        eye.isSelected.toggle()
    }
    
}

