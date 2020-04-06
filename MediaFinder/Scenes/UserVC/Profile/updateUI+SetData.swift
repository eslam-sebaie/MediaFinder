//
//  updateUI+SetData.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
extension ProfileViewController: SignUpView{
    func fetchDataSuccess(userObject: Users) {
        nameLable.text = userObject.name
        emailLabel.text = userObject.email
        passLable.text = userObject.password
        phoneLable.text = userObject.phone
        genderLabel.text = userObject.gender
        addressLabel.text = userObject.address
    }
    
    func updateUI() {
        
        logoutButtonChange.layer.cornerRadius = 23
        logoutButtonChange.layer.masksToBounds = true
        imagePicker.delegate = self
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
        profileImage.image = imageSave.getSavedImage(named: "fileName1")
        
    }
}
