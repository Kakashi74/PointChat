//
//  ProfileVC.swift
//  pointchat
//
//  Created by Ahmed on 11/8/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var profileUserImage: UIImageView!
    @IBOutlet weak var profileUserEmail: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    self.profileUserEmail.text = Auth.auth().currentUser?.email
    
    }

    @IBAction func logOutBtnPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "LogOut", message: "Are you sure to Logout ", preferredStyle: .actionSheet)
        
        let logOutAction = UIAlertAction(title: "LogOut", style: .destructive) { (UIAlertAction) in
            do{
          try  Auth.auth().signOut()
                let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC
                self.present(loginVC!, animated: true, completion: nil)
            } catch {
            print("Error Happend")
            }
        }
        
        alert.addAction(logOutAction)
        present(alert, animated: true, completion: nil)
    }
}
