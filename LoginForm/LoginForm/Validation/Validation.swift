//
//  Validation.swift
//  LoginForm
//
//  Created by User on 01.11.2022.
//

import Foundation

internal class Validation {
    
    static func isNameFieldCorrect(_ firstNameOrLastName: String?) -> Bool {
        guard let firstNameOrLastName = firstNameOrLastName else {
            return false
        }
        return firstNameOrLastName != "" ? true : false
    }
    
    static public func checkOnRegex(_ text: String?, type: ValidationType) -> Bool {
        guard let text = text else {
            return false
        }
        let predicate = text.range(of: type.rawValue, options: .regularExpression)
        return predicate != nil ? true : false
    }
    
    static public func isPasswordsSimillar(_ password: String?, _ confirmPassword: String?) -> Bool {
        return (password == confirmPassword) && (password != "")
    }
    
    enum ValidationType: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password  = "^.{8,}$"
    }
        
    
}
