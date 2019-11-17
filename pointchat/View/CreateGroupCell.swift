//
//  CreateGroupCell.swift
//  pointchat
//
//  Created by Ahmed on 11/11/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class CreateGroupCell: UITableViewCell {

    
    @IBOutlet weak var profileimageView: UIImageView!
    
    @IBOutlet weak var checkMarkImageView: UIImageView!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    var showing = false
    
    func configureCell(forprofile image: UIImage ,username name:String , isSelected: Bool){
        self.profileimageView.image = image
        self.userNameLbl.text = name
        if isSelected {
            self.checkMarkImageView.isHidden = false
        } else {
            self.checkMarkImageView.isHidden = true
            
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            if showing == false {
             self.checkMarkImageView.isHidden = false
                showing = true
        }
        else {
            self.checkMarkImageView.isHidden = true
                showing = false
        }
        }
        
    }
    
    
    
    
    
    

}
