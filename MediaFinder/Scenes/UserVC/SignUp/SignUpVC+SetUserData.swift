//
//  UserVC+SetUserData.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import SQLite
extension SignUpVC: sendingAddress {
    
    func setSqlData(){
        let insertUsers = sqlData.shared().usersTable.insert(sqlData.shared().email <- emailTextfield.text!, sqlData.shared().password <- passwordTextfield.text! , sqlData.shared().name <- nameTextfield.text!, sqlData.shared().phone <- phoneTextfield.text!, sqlData.shared().gender <- genderLabel.text!, sqlData.shared().address <- addressLabel.text!)
        do {
            try database.run(insertUsers)
            print("inserted")
        }catch {
            print("wrongInsert")
        }
    }
    
    func validate() -> Bool {
        if let name = nameTextfield.text, !name.isEmpty ,let email = emailTextfield.text, email != "", let pass = passwordTextfield.text, pass != "" ,let phone = phoneTextfield.text, phone != "", let gender = genderLabel.text, gender != "", let address = addressLabel.text ,address != ""
        {
            return true
        }
        return false
    }
    
    func switchIsChanged(switchGender: UISwitch) {
        
        if switchGender.isOn {
            genderLabel.text = "Male"
        }
        else {
            genderLabel.text = "Female"
        }
    }
    func send(address: String) {
        addressLabel.text = address
    }
    
    


    
    
}
