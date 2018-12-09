//
//  APIManager.swift
//  Skillzy
//
//  Created by Ibrahim El-geddawy on 10/19/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    class func userLogin( email : String, password : String, completion : @escaping (_ message : String?) -> Void){
        
        let url = URLs.main
        let parameter = ["email" : email, "password" : password]
        Alamofire.request(url, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: ["TOKEN" : "application/json"]).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                
                completion("Unvalide Email or Password")
            case .success(let value):
                let json = JSON(value)
                print(json)
                guard let dataDic = json.dictionary, let userDataDic = dataDic["data"]?.dictionary, let token = dataDic["token"]?.string, let user = UserInfo(dic: userDataDic) else {
                    completion("Unvalide Email or Password")
                    return
                }
                HelperUserDefaults.saveUser(user: user)
                completion("Successful")
            }
        }
    }
}
