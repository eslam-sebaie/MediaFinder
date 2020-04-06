//
//  SQLdata.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/9/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
import SQLite
struct sqlData {
    
    private static let sharedInstance = sqlData()
    
    static func shared() -> sqlData {
        
        return sqlData.sharedInstance
    }
    

//var database2: Connection!
    let ID = Expression<Int>("ID")
    let email = Expression<String>("Email")
    let password = Expression<String>("Password")
    let name = Expression<String>("Name")
    let phone = Expression<String>("Phone Number")
    let gender = Expression<String>("Gender")
    let address = Expression<String>("Address")
    let usersTable = Table("users")
//    var database: Connection!

    static func getDirectory (){
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileUrl = documentDirectory.appendingPathComponent("users2").appendingPathExtension("userSql2")
        print(fileUrl)
        let mydatabase = try! Connection(fileUrl.path)
        database = mydatabase
    }
    
    
    func createTable(){
        
        let createTable = usersTable.create { (table) in
            table.column(ID,primaryKey: true)
            table.column(email)
            table.column(password)
            table.column(name)
            table.column(phone)
            table.column(gender)
            table.column(address)
            
        }
        do {
            
            try database.run(createTable)
            print("tableCreated")
            
        }catch{
            print("errorCreated")
        }
    }
    
    
    
    func getData()-> AnySequence<Row>{
       
//        sqlData.shared().getDirectory()
       let returnUsers = try! database.prepare(sqlData.shared().usersTable)
       return returnUsers
    }
    
    
    
}
