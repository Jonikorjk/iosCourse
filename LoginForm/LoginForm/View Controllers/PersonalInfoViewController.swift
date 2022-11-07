//
//  PersonalInfoViewController.swift
//  LoginForm
//
//  Created by User on 18.10.2022.
//
import UIKit
import PhotosUI

class PersonalInfoViewController: UIViewController, PHPickerViewControllerDelegate {

    public var datasaver: DataSaverController!

    @IBOutlet var importImageButton: UIButton!
    @IBOutlet var date: UIDatePicker!
    @IBOutlet var selfPhotoImage: UIImageView!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var errFirstNameLabel: UILabel!
    @IBOutlet var errLastNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errFirstNameLabel.isHidden = true
        errLastNameLabel.isHidden = true
        date.contentVerticalAlignment = .center
        date.contentHorizontalAlignment = .center
    }

    
    //MARK: NEEDS TO REPEAT. крч пон. но лучше повторить)
    @IBAction func pressImportImageButton(_ sender: Any) {
        var cfg = PHPickerConfiguration(photoLibrary: .shared())
        cfg.selectionLimit = 1
        cfg.filter = PHPickerFilter.any(of: [.images, .livePhotos])
        let vc = PHPickerViewController(configuration: cfg)
        vc.delegate = self
        present(vc, animated: true)
        // i also can just print like ` cfg.filrer = .images ` but i want to learn above variant too :) )
    }

    //MARK: переписать, очень затратно
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        results.forEach{ result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading , error in
                guard let image = reading as? UIImage, error == nil else  {
                    return
                }
                self.selfPhotoImage.image = image
                self.importImageButton.isHidden = true
            }
        }
    }
    
    func convertDateToString(_ date: UIDatePicker, datastyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datastyle
        return dateFormatter.string(from: date.date)
    }
    
    @IBAction func toConfirmScene(_ sender: UIButton) {
        if let confirmVC = storyboard?.instantiateViewController(withIdentifier: "ConfirmationViewController") as? ConfirmationViewController {
            if !Validation.isNameFieldCorrect(firstNameTextField.text) ||
               !Validation.isNameFieldCorrect(lastNameTextField.text) {
                checkFirstName("")
                checkLastName("")
                return
            }
            
            datasaver.personalInfo = PersonalInfo(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, birthday: convertDateToString(date, datastyle: .short), selfphoto: selfPhotoImage.image!)
            
            confirmVC.datasaver = datasaver
            self.navigationController?.pushViewController(confirmVC, animated: true)
        }
    }
    
    @IBAction func checkFirstName(_ sender: Any) {
        if (firstNameTextField.text == "") {
            errFirstNameLabel.isHidden = false
        }
        else {
            errFirstNameLabel.isHidden = true
        }
    }
    
    @IBAction func checkLastName(_ sender: Any) {
        if (lastNameTextField.text == "") {
            errLastNameLabel.isHidden = false
        }
        else {
            errLastNameLabel.isHidden = true
        }
    }
    
    
}
