//
//  GroupCell.swift
//  pointchat
//
//  Created by Ahmed on 11/12/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    
    @IBOutlet weak var groupTitleLbl: UILabel!
    
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    
    @IBOutlet weak var groupMemberLbl: UILabel!
    
    
    
    func configureCell(forTitle title: String , forDescription description: String ,membersCount members: Int){
        
        self.groupTitleLbl.text = title
        self.groupDescriptionLbl.text = description
        self.groupMemberLbl.text = "\(members) members"
    }
    
 

}
