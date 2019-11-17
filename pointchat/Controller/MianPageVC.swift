//
//  FirstViewController.swift
//  pointchat
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class MainPageVC: UIViewController {

 
    @IBOutlet weak var tableView: UITableView!
    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataServices.instance.getAllMessages { (mArray) in
            self.messageArray = mArray.reversed()
            self.tableView.reloadData()
            
        }
    }


}


extension MainPageVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postcell") as? PostCell else {
            return PostCell()
        }
        let image = UIImage(named: "defaultImageProfile")
        let msg = messageArray[indexPath.row]
        DataServices.instance.getUserName(forId: msg.senderId) { (username) in
            cell.configureCell(img: image!, email: username , post: msg.content)
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    
}

