//
//  SecondViewController.swift
//  pointchat
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var groupArray = [Group]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DataServices.instance.DATA_GROUPS.observe(.value) { (DataSnapshot) in
            DataServices.instance.getAllGroups { (GroupArray) in
                self.groupArray = GroupArray
                self.tableView.reloadData()
            }
        }
    }
    
    
}



extension GroupsVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell else {
            return UITableViewCell()}
        let group = groupArray[indexPath.row]
        cell.configureCell(forTitle: group.title, forDescription: group.description, membersCount: group.membersCount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupArray.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeedVC = storyboard?.instantiateViewController(identifier: "GroupFeedVC") as? GroupFeedVC else {
            return
        }
        groupFeedVC.initGroupData(group: groupArray[indexPath.row])
        present(groupFeedVC, animated: true, completion: nil)
    }
    
}

