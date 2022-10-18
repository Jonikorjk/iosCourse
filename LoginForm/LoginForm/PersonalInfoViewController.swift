//
//  PersonalInfoViewController.swift
//  LoginForm
//
//  Created by User on 18.10.2022.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func pressNextButton(_ sender: UIButton) {
        var newVC = storyboard?.instantiateViewController(withIdentifier: "ConfirmationViewController")
        navigationController?.pushViewController(newVC!, animated: true)
    }
}
