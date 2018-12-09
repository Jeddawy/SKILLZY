//
//  ViewController.swift
//  Skillzy
//
//  Created by Ibrahim El-geddawy on 10/18/18.
//  Copyright © 2018 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class SigninVC : Validator {
    let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Welcomming") as! Welcomming
    @IBOutlet weak var eMail_TF: UITextField!
    @IBOutlet weak var password_TF: UITextField!
    @IBOutlet weak var singin_Btn: UIButton!
    @IBOutlet weak var passwordVeiw_View: UIView!
    @IBOutlet weak var emailView_View: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedViews()
    }
    
    func roundedViews(){
        self.singin_Btn.roundCorners(cornerRadius: 5.5)
        self.emailView_View.cornerStylish(color: .purple, borderWidth: 3, cornerRadius: 5.5)
        self.passwordVeiw_View.cornerStylish(color: .purple, borderWidth: 3, cornerRadius: 5.5)
        self.singin_Btn.dropShadow(color: .black, opacity: 0.5, offSet: CGSize(width: 0.2, height: 2.0), radius: 1, scale: true)
        
    }
    @IBAction func signin_pressedBtn(_ sender: UIButton) {
        guard let emailAddress = eMail_TF.text, isValidEmail(email: emailAddress) else {
            self.showErrorMessage(message: "Invalid Email Address!")
            return
        }
        
        guard let password = password_TF.text, isValidPassword(password: password) else{
            self.showErrorMessage(message: "Invalid Password!")
            return
        }
        
        APIManager.userLogin(email: emailAddress, password: password) { (message) in
            if let message = message, message == "Successful" {
                //.....
                let user = HelperUserDefaults.getUser()
                print(user!.email, user!.id, user!.cards_count, user!.is_listed)
                self.navigationController?.pushViewController(self.secondVC, animated: true)
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

