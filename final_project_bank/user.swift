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
    
    init(userId:Int, userName:String) {
        self.userId = userId
        self.userName = userName
    }
    
    func printDetails(){
        print("👤Id:\(self.userId)    Name:\(self.userName)")
    }
}
