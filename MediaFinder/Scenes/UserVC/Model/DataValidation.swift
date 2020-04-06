//
//  dataInputValidation.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/9/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
struct valid {
    
   
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z.]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailPred.evaluate(with: email) {
            return true
        }
            
        else {
            return false
        }
    }
    func isPasswordValid(_ password : String) -> Bool{
        let passRegEx = "^(?=.*[A-Z])(?=.*[!@#$_&*])(?=.*[0-9])(?=.*[a-z]).{8,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",passRegEx)
        if passwordTest.evaluate(with: password){
            return true
        }
        else {
            return false
        }
    }
}


