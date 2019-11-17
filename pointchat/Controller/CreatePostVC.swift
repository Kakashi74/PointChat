//
//  CreatePostVC.swift
//  pointchat
//
//  Created by Ahmed on 11/8/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var postAreaTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendBtn.bindToKeyboard()
        postAreaTextView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.userEmail.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        
        if postAreaTextView.text != " this is my first post " && postAreaTextView.text != nil {
            sendBtn.isEnabled = false
            DataServices.instance.createPost(withMessage: postAreaTextView.text, ForID: (Auth.auth().currentUser?.uid)!, WithKey: nil) { (sendComplete) in
                if sendComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = false
                print("There's an Error")
                
                }
            }
            
        }
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
   

}



extension CreatePostVC : UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        postAreaTextView.text = " "
    }
}






