//
//  HelperUserDefaults.swift
//  Skillzy
//
//  Created by Ibrahim El-geddawy on 10/19/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

class HelperUserDefaults {
    
    class func saveUser(user: UserInfo){
        let data  = NSKeyedArchiver.archivedData(withRootObject: user)
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: "UserInfo")
        defaults.synchronize()
    }
    
    class func getUser() -> UserInfo? {
        if let data = UserDefaults.standard.object(forKey: "UserInfo") as? Data {
            let user = NSKeyedUnarchiver.unarchiveObject(with: data) as! UserInfo
            return user
        }
        return nil
    }
    class func removeSelectedPaymentCard() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "UserInfo")
        def.synchronize()
    }
}
