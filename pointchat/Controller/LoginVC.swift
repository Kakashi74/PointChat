//
//  LoginVC.swift
//  pointchat
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTextField: CustomTF!
    @IBOutlet weak var passwordTextField: CustomTF!
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {

        if emailTextField.text != nil && passwordTextField.text != nil {
            
            AuthService.instance.loginUser(withEmail: emailTextField.text!, andPassword: passwordTextField.text!) { (completed, error) in
                if completed {
                    self.dismiss(animated: true, completion: nil)
                } else {
                  //  debugPrint(error?.localizedDescription)
                }
                
                AuthService.instance.registerUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (complete, error) in
                    if complete {
                        AuthService.instance.loginUser(withEmail: self.emailTextField.text!, andPassword: self.passwordTextField.text!) { (completed, error) in
                                      if completed {
                                        //  self.dismiss(animated: true, completion: nil)
                                      }
                    }
                    }
                    else{
                      //  debugPrint(error?.localizedDescription)
                    }
            }
        }
    }
}
}

extension LoginVC : UITextFieldDelegate {
    
}
