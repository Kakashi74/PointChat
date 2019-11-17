//
//  CustomTF.swift
//  pointchat
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

class CustomTF: UITextField {
    
    private var padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    
    override func awakeFromNib() {
        setUpView()
        super.awakeFromNib()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect( bounds , padding )
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
       return UIEdgeInsetsInsetRect( bounds , padding )
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect( bounds , padding )
    }
    
    
    func setUpView() {
        
        let placeHolder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor  :#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)])
    
        
        self.attributedPlaceholder = placeHolder
    }
    
    
}
