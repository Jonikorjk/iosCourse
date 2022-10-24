//
//  DataSaverController.swift
//  LoginForm
//
//  Created by User on 23.10.2022.
//

import Foundation
import UIKit

struct PersonalInfo {
    var firstName: String
    var lastName: String
    var birthday: String
    var selfphoto: UIImage
}

struct User {
    var email: String
    var password: String
    var personalInfo: PersonalInfo?
}

class DataSaverController {
    private var data: User
    
    var personalInfo: PersonalInfo? {
        get {
            return data.personalInfo
        }
        set {
            data.personalInfo = newValue
        }
    }
    
    var email: String {
        return "Email: " + data.email
    }
    var firstName: String {
        return "First Name: " + data.personalInfo!.firstName
    }
    
    var lastName: String {
        return "Last Name: " + data.personalInfo!.lastName
    }
    
    var birthday: String {
        return "Birthday: " + data.personalInfo!.birthday
    }
    
    var avatarPhoto: UIImage {
        return data.personalInfo!.selfphoto
    }
    
    init(data: User) {
        self.data = data
    }
}
