//
//  User.swift
//  final_project_bank
//
//  Created by Omairys Uzcátegui on 2021-06-09.
//

import Foundation
class User {
    var userId: Int
    var userName: String
    var isClient: Bool
    
    init(userId:Int, userName:String, isClient:Bool) {
        self.userId = userId
        self.userName = userName
        self.isClient = isClient
    }
    
    func printDetails(){
        print("Id:\(self.userId)    Name:\(self.userName)   isClient:\(self.isClient)")
    }
}
