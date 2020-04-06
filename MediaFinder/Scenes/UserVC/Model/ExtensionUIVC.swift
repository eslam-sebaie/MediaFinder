//
//  instantiateViews.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/9/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    public func show_Alert(_ title: String) {
        
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in}
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }
    func instantiateSignUpVC(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let SigninVC = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.present(SigninVC ,animated: true, completion: nil)
        
    }
    
    func instantiateMapVC(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = sb.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        mapVC.delegate = (self as! sendingAddress)
        self.present(mapVC ,animated: true, completion: nil)
    }
    
    
    func instantiateSigninVC(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let SigninVC = sb.instantiateViewController(withIdentifier: "SigninVC") as! SigninVC
        self.present(SigninVC ,animated: true, completion: nil)
    }
     func instantiateProfileVC(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = sb.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
         self.present(profileVC ,animated: true, completion: nil)
    }
}

