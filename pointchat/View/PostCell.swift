//
//  PostCell.swift
//  pointchat
//
//  Created by Ahmed on 11/9/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

       
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userPostField: UILabel!
    
    func configureCell(img: UIImage , email: String , post: String) {
        
        self.userImageView.image = img
        self.userEmail.text = email
        self.userPostField.text = post
    }
    
    

}
