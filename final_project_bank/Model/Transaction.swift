//
//  Transactions.swift
//  final_project_bank
//
//  Created by Omairys Uzcátegui on 2021-06-10.
//

import Foundation
class Transaction {
    var accountId: Int
    var transactionType: String
    var transactionId: Int
    var amount: Double
    
    init(accountId: Int, transactionType: String, transactionId: Int, amount: Double) {
        self.accountId = accountId
        self.transactionId = transactionId
        self.transactionType = transactionType
        self.amount = amount
    }
    
    func printDetails() {
        print("\((String(self.transactionId)).padding(toLength: 20, withPad: " ", startingAt: 0))\((self.transactionType).padding(toLength: 20, withPad: " ", startingAt: 0))\((String(self.accountId)).padding(toLength: 20, withPad: " ", startingAt: 0))\(self.amount)")
    }
    
    //MARK: File Utility Functions of Account
    func fileRepresentation() -> String {
        return "\(accountId),\(transactionType),\(transactionId),\(amount)\n"
    }
    
    static func parseFileRepresentation(str: String) -> Transaction {
        let tokenized = str.components(separatedBy: ",")
        return Transaction(accountId: Int(tokenized[0])!, transactionType: tokenized[1], transactionId: Int(tokenized[2])!, amount: Double(tokenized[3])!)
    //---------------------------------------------
    }
}
