//
//  userDefaultManager.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/8/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
class UserDefaultsManager {
    
   private static let sharedInstance = UserDefaultsManager()
    
    static func shared() -> UserDefaultsManager {
    
        return UserDefaultsManager.sharedInstance
    }
    
    var isLogged: Bool  {
        
        set {
            
            UserDefaults.standard.set(newValue, forKey: userDefaultKeys.isLogged)
            UserDefaultsManager.setData(val: newValue)
        }
        get {
            
            return UserDefaults.standard.bool(forKey: userDefaultKeys.isLogged)
        }
        
    }
    static func setData(val: Bool) {
    
            let users = User(isLogged: val)
            let encoder = JSONEncoder()
            guard let encoded = try? encoder.encode(users) else {return}
            UserDefaults.standard.set(encoded, forKey: "users")
    
        }
    
      static func readData() -> User {
    
            let decoder = JSONDecoder()
            let savedUser = (UserDefaults.standard.object(forKey: "users") as? Data)!
             let storedData = try? decoder.decode(User.self, from: savedUser)
            return storedData!
        }

}
