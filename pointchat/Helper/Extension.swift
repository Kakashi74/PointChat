//
//  Extension.swift
//  pointchat
//
//  Created by Ahmed on 11/8/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func bindToKeyboard(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardChange), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    
    @objc func keyBoardChange (_ notification : NSNotification){
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve  = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let beginFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endFrame =  (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let change = endFrame.origin.y - beginFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y  +=  change
        }, completion: nil)
  
    
    }
    
}





