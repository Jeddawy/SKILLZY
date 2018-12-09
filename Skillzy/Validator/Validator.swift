//
//  Validator.swift
//  Skillzy
//
//  Created by Ibrahim El-geddawy on 10/18/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class Validator: UIViewController {
    
    func isValidEmail(email : String?) -> Bool {
        guard let email = email?.trimmingCharacters(in: .whitespaces), !email.isEmpty else {
            self.showErrorMessage(message: "Please Enter Valid E-mail")
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailPred.evaluate(with: email){
            self.showErrorMessage(message: "Please Enter Valid E-mail")
            return false
        }
        
        return true
    }
    func isValidPassword(password : String?) -> Bool {
        guard let password = password, !password.isEmpty, password.count >= 8 else {
            self.showErrorMessage(message: "Please Enter Valid Password and At Least 8 Characters")
            return false
        }
        return true
    }
}
