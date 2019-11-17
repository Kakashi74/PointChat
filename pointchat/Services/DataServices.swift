//
//  DataServices.swift
//  pointchat
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import Foundation
import Firebase

class DataServices {
    
    static let instance = DataServices()
    private var _DATA_REF = Database.database().reference()
    private var _DATA_USERS = Database.database().reference().child("users")
    private var _DATA_GROUPS = Database.database().reference().child("groups")
    private var _DATA_FEEDS = Database.database().reference().child("feeds")
    
    
    var DATA_REF : DatabaseReference {
        return _DATA_REF
    }
    var DATA_USERS : DatabaseReference {
           return _DATA_USERS
       }
    var DATA_GROUPS : DatabaseReference {
           return _DATA_GROUPS
       }
    var DATA_FEEDS : DatabaseReference {
           return _DATA_FEEDS
       }
    
    
    
    func createUserDB(uid: String , userData : Dictionary<String , Any>){
        DATA_USERS.child(uid).updateChildValues(userData)
    }
    
    
    func createPost(withMessage message: String , ForID uid: String , WithKey key: String? ,sendComplete: @escaping (_ complete : Bool) -> () )
    {
        
        if key != nil {
            //send msg
        } else {
            DATA_FEEDS.childByAutoId().updateChildValues(["content" : message , "senderid" : uid])
            sendComplete(true)
        }
    }
    
    
    
    func getAllMessages(completion: @escaping (_ message:[Message]) -> ()){
      
          var msgArray = [Message]()
            DATA_FEEDS.observeSingleEvent(of: .value) { (DataSnapshot) in
            guard let msgDataSnapshot = DataSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
            for message in msgDataSnapshot  {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderid").value as! String
                let MSG = Message(content: content, senderId: senderId)
                msgArray.append(MSG)
            
            }
            completion(msgArray)
            
        }
    }
    
    
    func getUserName(forId uid: String , handler: @escaping (_ username : String)->()){
        DATA_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            
            guard let snapShot = userSnapshot.children.allObjects as? [DataSnapshot] else {
                return
            }
            
            for user in snapShot {
                if user.key == uid{
                    handler(user.childSnapshot(forPath: "email").value as! String)
            }
            }
        }
    }
    
    
    
    func getUsersQuery(forQuery query: String , handler: @escaping (_ email:[String])->())
    {
        var emailArray = [String]()
        DATA_USERS.observe(.value) { (DataSnapshot) in
            guard let userSnapshot = DataSnapshot.children.allObjects as? [DataSnapshot]  else {
                return
            }
            
            for user in userSnapshot {
                
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if email.contains(query) == true && email  != Auth.auth().currentUser?.email {
                    emailArray.append(email)
                }
                
            }
            
            handler(emailArray)
            
        }
        
    }
    
    
    func getIds(forUserName username: [String] , handler: @escaping (_ idArray: [String]) -> ()){
        
        DATA_USERS.observeSingleEvent(of: .value) { (DataSnapshot) in
            var idArray = [String]()
            guard let userSnapShot = DataSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapShot {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if username.contains(email){
                    idArray.append(user.key)
                }
            }
        handler(idArray)
        }
    }
    
    
    
    func createGroup(forTitle title: String , forDescription description: String , forIds id: [String] , handler: @escaping (_ Completed: Bool) -> ()){
        DATA_GROUPS.childByAutoId().updateChildValues(["title": title ,"description": description , "members": id ])
        handler(true)
    }
     
    
    func getAllGroups(handler: @escaping (_ groupArray:[Group] ) -> ()){
        var groupArray = [Group]()
        
        DATA_GROUPS.observeSingleEvent(of: .value, with: { (DataSnapshot) in
                
            guard let groupSnapshot = DataSnapshot.children.allObjects as? [DataSnapshot]
                else{ return }
            for group in groupSnapshot {
                let member = group.childSnapshot(forPath: "members").value as! [String]
                if member.contains((Auth.auth().currentUser?.uid)!){
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    
                    
                    let group = Group(title: title, description: description, key: group.key, membersCount: member.count, members: member)
                    
                    groupArray.append(group)
                 }
                handler(groupArray)
            }
            
        })
        
        
        
    }
    
    func getEmails(group: Group , handler: @escaping (_ emailArray: [String]) -> ()){
        var emailArray = [String]()

        DATA_USERS.observeSingleEvent(of: .value) { (DataSnapshot) in
           guard let EmailSnapShot = DataSnapshot.children.allObjects as? [DataSnapshot] else { return }
              
            for userEmail in EmailSnapShot {
                if group.members.contains(userEmail.key){
                    
                    let email = userEmail.childSnapshot(forPath: "email").value as! String
                    emailArray.append(email)
                }
            }
            handler(emailArray)
            
        }
    }
    
}
