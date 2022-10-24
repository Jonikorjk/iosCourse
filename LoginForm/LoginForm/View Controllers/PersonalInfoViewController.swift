//
//  PersonalInfoViewController.swift
//  LoginForm
//
//  Created by User on 18.10.2022.
//

import UIKit
import PhotosUI

class PersonalInfoViewController: UIViewController, PHPickerViewControllerDelegate {

    var datasaver: DataSaverController!

    @IBOutlet var importImageButton: UIButton!
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
                //TODO: add validation on Avatar
            if let destVC = segue.destination as? ConfirmationViewController {
                //TODO: add data and photo
                datasaver.personalInfo = PersonalInfo(firstName: f_name.text!, lastName: l_name.text!, birthday: convertDateToString(date, datastyle: .short), selfphoto: selfPhoto.image!)
                destVC.datasaver = datasaver
            
            }
        }
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

    //MARK: Ниче не понял, но пойму!!!!!!!!!!!!!
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        results.forEach{ result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading , error in
                guard let image = reading as? UIImage, error == nil else  {
                    return
                }
                self.selfPhoto.image = image
                self.importImageButton.isHidden = true
            }
        }
    }
    
    func convertDateToString(_ date: UIDatePicker, datastyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datastyle
        return dateFormatter.string(from: date.date)
    }
}
