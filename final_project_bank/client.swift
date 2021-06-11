//
//  client.swift
//  final_project_bank
//
//  Created by Omairys Uzcátegui on 2021-06-09.
//

import Foundation
class Client : User{
    var phone: Int
    var address: String
    
    init(userId: Int, userName: String, phone: Int, address: String) {
        self.phone = phone
        self.address = address
        
        super.init(userId: userId, userName: userName)
    }
    
    override func printDetails() {
        super.printDetails()
        print("Phone:\(self.phone)    Address:\(self.address)\n")
    }
    
    func fileRepresentation() -> String {
        return "\(userId),\(userName),\(phone),\(address)\n"
    }
    
    static func parseFileRepresentation(str: String) -> Client {
        let tokenized = str.components(separatedBy: ",")
        return Client(userId: Int(tokenized[0])!, userName: tokenized[1], phone: Int(tokenized[2])!, address: tokenized[3])
    //---------------------------------------------
    }
}
