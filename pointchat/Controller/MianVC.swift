//
//  MianVC.swift
//  pointchat
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit
import Firebase

class MianVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    @IBAction func loginByEmailBtnPressed(_ sender: Any) {
   
        let loginVC = storyboard?.instantiateViewController(identifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
    }
    
    @IBAction func loginByGmailBtnPressed(_ sender: Any) {
    }
    
    @IBAction func loginByFbBtnPressed(_ sender: Any) {
    }
    
}
