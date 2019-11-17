//
//  GroupFeedCell.swift
//  pointchat
//
//  Created by Ahmed on 11/17/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

 
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var emailUser: UILabel!
    
    @IBOutlet weak var contentFeed: UILabel!
    
    
    
    func configCell(profileImage: UIImage , email: String , content: String){
        self.profileImage.image = profileImage
        self.emailUser.text = email
        self.contentFeed.text = content
        
    }
}
