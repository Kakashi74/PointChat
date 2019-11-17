//
//  GroupFeedVC.swift
//  pointchat
//
//  Created by Ahmed on 11/17/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var groupTitle: UILabel!
    
    @IBOutlet weak var membersLbl: UILabel!
    
    @IBOutlet weak var sendMessageView: UIView!
    
    @IBOutlet weak var enterMessageTF: UITextField!
    
    @IBOutlet weak var sendBtn: UIButton!
    
  
    var group: Group?
    
    func initGroupData(group: Group){
        self.group = group
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        sendMessageView.bindToKeyboard()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitle.text = group?.title
        DataServices.instance.getEmails(group: group!) { (emailArray) in
            self.membersLbl.text = emailArray.joined(separator: " , ")
        }
       
        
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
extension GroupFeedVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
}
