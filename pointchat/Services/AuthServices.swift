//
//  AuthServices.swift
//  pointchat
//
//  Created by Ahmed on 11/7/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import Foundation
import Firebase

class AuthService{
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String ,andPassword password: String , registerCompletion: @escaping  (_ status: Bool , _ error: Error?) -> () ){
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            guard let user = user else {
                
                registerCompletion(false , error)
                
                return
            }
            
            let uData = ["provider" : user.user.providerID , "email" : user.user.email]
            
            DataServices.instance.createUserDB(uid: user.user.uid, userData: uData as Dictionary<String, Any>)
            registerCompletion(true , nil)
            
        }
    }
    
    
    
    
    func loginUser(withEmail email: String ,andPassword password: String , loginCompletion: @escaping  (_ status: Bool , _ error: Error?) -> ()){
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                loginCompletion(false , error)
                
                return
            }
            loginCompletion(true , nil)
        }
        
    }
    
}

