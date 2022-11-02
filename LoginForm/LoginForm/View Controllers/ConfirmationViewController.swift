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
    @IBOutlet var selfPhoto: UIImageView!

    var storageKey = "Users"
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        f_name.text = datasaver.firstName
        l_name.text = datasaver.lastName
        email.text = datasaver.email
        dateBirth.text = datasaver.birthday
        selfPhoto.image = datasaver.avatarPhoto
        
    }
    @IBAction func toRootScene(_ sender: UIButton) {
//        if let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") {
            var storage = [Dictionary<String,String>]()
            var userInfo = Dictionary<String, String>()
            userInfo["login"] = datasaver.email
            userInfo["password"] = datasaver.data.password
            storage.append(userInfo)
            userDefaults.set(storage, forKey: storageKey)
            self.navigationController?.popToRootViewController(animated: true)
//            self.navigationController?.pushViewController(welcomeVC, animated: true)
//        }
    }
    

}
