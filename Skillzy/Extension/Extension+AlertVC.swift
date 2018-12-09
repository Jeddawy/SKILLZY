//
//  Extension+AlertVC.swift
//  Skillzy
//
//  Created by Ibrahim El-geddawy on 10/18/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    func showErrorMessage(message : String){
        let inValidAlerts = UIAlertController(title: "UnSuccessful", message: message, preferredStyle: .alert)
        let oKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            inValidAlerts.dismiss(animated: true, completion: nil)
        }
        inValidAlerts.addAction(oKAction)
        self.present(inValidAlerts, animated: true, completion: nil)
    }
    
}
