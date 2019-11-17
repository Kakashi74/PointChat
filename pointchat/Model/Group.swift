//
//  Group.swift
//  pointchat
//
//  Created by Ahmed on 11/13/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import Foundation

class Group {
    
   private var _title: String
   private var _description: String
    private var _key: String
    private var _memberCount: Int
    private var _members: [String]


    var title: String{
        return _title
    }
    
    var description: String{
        return _description
    }
    
    var key: String{
        return _key
    }
    
    var membersCount: Int{
        return _memberCount
    }
    
    var members: [String]{
        return _members
    }

    
     init(title: String , description: String , key: String , membersCount: Int , members: [String] ){
        self._title = title
        self._description = description
        self._key = key
        self._memberCount = membersCount
        self._members = members
        
    }



}
