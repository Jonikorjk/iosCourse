//
//  ConfirmationViewController.swift
//  LoginForm
//
//  Created by User on 18.10.2022.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    var datasaver: DataSaverController!
    
    @IBOutlet var f_name: UILabel!
    @IBOutlet var l_name: UILabel!
    @IBOutlet var dateBirth: UILabel!
    @IBOutlet var email: UILabel!
    override func viewDidLoad() {
        f_name.text = datasaver.firstName
        l_name.text = datasaver.lastName
        email.text = datasaver.email
        dateBirth.text = datasaver.birthday
        
        super.viewDidLoad()
        
    }

}
