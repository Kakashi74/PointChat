//
//  CreateGroupVC.swift
//  pointchat
//
//  Created by Ahmed on 11/10/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupVC: UIViewController {

   
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var eamilTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var donebtn: UIButton!
   
    var emailArray = [String]()
    var choosenMemberArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        eamilTextField.delegate = self
        eamilTextField.addTarget(self, action: #selector(textFieldChange), for: .editingChanged)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        donebtn.isHidden = true
    }
    
    @objc func textFieldChange(){
        if eamilTextField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else {
            DataServices.instance.getUsersQuery(forQuery: eamilTextField.text!) { (emailArray) in
                
                self.emailArray = emailArray
                self.tableView.reloadData()
            }
        }
        
        
    }
    
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataServices.instance.getIds(forUserName: choosenMemberArray) { (idsArray) in
                var userId = idsArray
                userId.append((Auth.auth().currentUser?.uid)!)
                
                DataServices.instance.createGroup(forTitle: self.titleTextField.text!, forDescription: self.descriptionTextField.text!, forIds: userId) { (Completed) in
                    if Completed {
                        
                        self.dismiss(animated: true, completion: nil)
                        
                    }else {
                        
                    }
                }
                
            }
            
        }
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

extension CreateGroupVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "usercell") as? CreateGroupCell else {
            return CreateGroupCell()}
        
        let profileImage = UIImage(named: "defaultProfileImage")
        if choosenMemberArray.contains(emailArray[indexPath.row]) {
            cell.configureCell(forprofile: profileImage!, username: emailArray[indexPath.row], isSelected: true)
            
        } else{
        cell.configureCell(forprofile: profileImage!, username: emailArray[indexPath.row], isSelected: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         guard let cell = tableView.cellForRow(at: indexPath) as? CreateGroupCell else {
                   return
        }
        if !choosenMemberArray.contains(cell.userNameLbl.text!){
            choosenMemberArray.append(cell.userNameLbl.text!)
            donebtn.isHidden = false
        }
        else {
            donebtn.isHidden = true
        }
              
    }
    
}

extension CreateGroupVC : UITextFieldDelegate {
    
}
