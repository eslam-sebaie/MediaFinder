//
//  SignUpVC+SignButton.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
extension SignUpVC {
    
    func signPress(){
        if validate()  {
            if presenter.validationModel.isValidEmail(emailTextfield.text!) {
                checkEmailLabel.isHidden = true
                emailTextfield.layer.borderColor = UIColor.clear.cgColor
                if presenter.validationModel.isPasswordValid(passwordTextfield.text!) {
                    checkPassLabel.isHidden = true
                    passwordTextfield.layer.borderColor = UIColor.clear.cgColor
                    UserDefaultsManager.shared().isLogged = false
                    print(UserDefaultsManager.shared().isLogged)
                    presenter.viewDidLoad()
                    setSqlData()
                    instantiateSigninVC()
                }
                else if !presenter.validationModel.isPasswordValid(passwordTextfield.text!) {
                    checkPassLabel.isHidden = false
                    passwordTextfield.layer.borderColor = UIColor.red.cgColor
                    
                }
                
            }
            else if !presenter.validationModel.isValidEmail(emailTextfield.text!) {
                
                checkEmailLabel.isHidden = false
                emailTextfield.layer.borderColor = UIColor.red.cgColor
            }
            
            
            
        }
        else if !validate() {
            show_Alert("Enter Your Missing Data")
        }
        
    }
    
    
}
