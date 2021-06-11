//
//  operator.swift
//  final_project_bank
//
//  Created by Omairys Uzcátegui on 2021-06-09.
//

import Foundation
class Operator : User{
    var alias: String

    init(userId: Int, userName: String, alias: String) {
        self.alias = alias
        super.init(userId: userId, userName: userName)
    }
    
    override func printDetails() {
        super.printDetails()
        print("Alias:\(self.alias)")
    }
}
