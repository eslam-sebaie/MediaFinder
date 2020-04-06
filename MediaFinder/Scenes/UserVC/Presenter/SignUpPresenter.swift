//
//  SignUpPresenter.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/15/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import SQLite
protocol SignUpView: class {
    func fetchDataSuccess(userObject: Users)
}

class SignUpPresenter {
    
    private weak var delegate: SignUpView?
    var validationModel = valid()
    var newData: AnySequence<Row>!
    var userObj = Users()
    
    init(view: SignUpView) {
        self.delegate = view
    }
    
    func viewDidLoad(){
        sqlData.shared().createTable()
    }
    
    func getDirec(){
        sqlData.getDirectory()
    }


    func readSqlData(){
         newData = sqlData.shared().getData()
        for savedData in newData {
            userObj.name = savedData[sqlData.shared().name]
            userObj.email = savedData[sqlData.shared().email]
            userObj.password = savedData[sqlData.shared().password]
            userObj.phone = savedData[sqlData.shared().phone]
            userObj.gender = savedData[sqlData.shared().gender]
            userObj.address = savedData[sqlData.shared().address]
        }
        self.delegate?.fetchDataSuccess(userObject: userObj)
           
    }
    
    
}

    


