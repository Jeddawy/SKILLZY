//
//  UserInfo.swift
//  Skillzy
//
//  Created by Ibrahim El-geddawy on 10/18/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class UserInfo : NSObject, NSCoding {
    
    private var _id: Int!
    private var _name: String?
    private var _email: String!
    private var _cards_count: Int!
    private var _is_listed: Bool!
    
    
    var id: Int {
        return _id
    }
    var name: String {
        return _name ?? ""
    }
    var email: String {
        return _email
    }
    var cards_count: Int {
        return _cards_count
    }
    var is_listed: Bool {
        return _is_listed
    }
    
    init(email: String, name: String, id: Int, cards_count: Int) {
        self._email = email
        self._name = name
        self._id = id
        self._cards_count = cards_count
    }
    
    required init?(coder aDecoder: NSCoder) {
        self._email = aDecoder.decodeObject(forKey: "email") as! String
        self._name = aDecoder.decodeObject(forKey: "name") as? String
        self._id = aDecoder.decodeObject(forKey: "id") as! Int
        self._cards_count = aDecoder.decodeObject(forKey: "cards_count") as! Int
        self._is_listed = aDecoder.decodeObject(forKey: "is_listed") as! Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self._email, forKey: "email")
        aCoder.encode(self._name, forKey: "name")
        aCoder.encode(self._id, forKey: "id")
        aCoder.encode(self._cards_count, forKey: "cards_count")
        aCoder.encode(self._is_listed, forKey: "is_listed")
    }
    
    
    init?(dic: [String : JSON]){
        guard let email = dic["email"]?.string, let id = dic["id"]?.int
            , let is_listed = dic["is_listed"]?.bool, let cards_count = dic["cards_count"]?.int
            else { return }
        self._email = email
        self._id = id
        self._is_listed = is_listed
        self._cards_count = cards_count
    }
}
