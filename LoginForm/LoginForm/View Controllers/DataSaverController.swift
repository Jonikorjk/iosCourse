//
//  DataSaverController.swift
//  LoginForm
//
//  Created by User on 23.10.2022.
//

import Foundation

struct PersonalInfo {
    var firstName: String
    var lastName: String
    //TODO: change optional values on non-optional
    var birthday: String?
    var selfphoto: String?
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
    
    var email: String? {
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
    
    init(data: User) {
        self.data = data
    }
}
