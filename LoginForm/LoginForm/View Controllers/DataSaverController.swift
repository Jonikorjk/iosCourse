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
    public var data: User
    
    var personalInfo: PersonalInfo? {
        get {
            return data.personalInfo
        }
        set {
            data.personalInfo = newValue
        }
    }
    var email: String {
        return data.email
    }
    
    var firstName: String? {
        return data.personalInfo?.firstName
    }
    
    var lastName: String? {
        return data.personalInfo?.lastName
    }
    
    var birthday: String? {

        return data.personalInfo?.birthday
    }
    
    var avatarPhoto: UIImage? {
        if let avtr = data.personalInfo?.selfphoto {
            return avtr
        }
        return nil
    }
    
    init(data: User) {
        self.data = data
    }
}
