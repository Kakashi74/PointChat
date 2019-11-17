//
//  Shadow.swift
//  pointchat
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        super.awakeFromNib()
    }
 
}
