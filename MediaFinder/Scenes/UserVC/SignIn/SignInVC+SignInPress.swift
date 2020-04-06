//
//  SignInVC+SignInPress.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
extension SigninVC: SignUpView {
    func fetchDataSuccess(userObject: Users) {
        if userObject.email == emailText.text && userObject.password == passText.text {            UserDefaultsManager.shared().isLogged = true
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let FilmVC = sb.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            //            FilmVC.idUser = sqlData1[sqlData.shared().ID]
            self.present(FilmVC ,animated: true, completion: nil)
        }
            
        else {
            show_Alert("IncorrectData")
        }
        
    }
    
//            presenter.readSqlData()
//        presenter.saveInUserObject()
    
    
}
