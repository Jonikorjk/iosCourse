//
//  PersonalInfoViewController.swift
//  LoginForm
//
//  Created by User on 18.10.2022.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    var datasaver: DataSaverController!

    @IBOutlet var date: UIDatePicker!
    @IBOutlet var selfPhoto: UIImageView!
    @IBOutlet var f_name: UITextField!
    @IBOutlet var l_name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ConfirmSegue" {
                //TODO: add validation func on textfields before segue (PIVC)
            if let destVC = segue.destination as? ConfirmationViewController {
                //TODO: add data and photo
                datasaver.personalInfo = PersonalInfo(firstName: f_name.text!, lastName: l_name.text!, birthday: convertDateToString(date, datastyle: .short), selfphoto: nil)
                destVC.datasaver = datasaver
            
            }
        }
    }
    
    @IBAction func dateChanger(_ sender: Any) {
        
    }
    
    func convertDateToString(_ date: UIDatePicker, datastyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datastyle
        return dateFormatter.string(from: date.date)
    }
}
