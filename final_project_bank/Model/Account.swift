//
//  account.swift
//  project
//
//  Created by Tatiana Ozerskaya on 09/06/2021.
//

import Foundation
class Account {
    
    var accountId: Int
    var clientId: Int
    var accountType: String
    var amount: Double
    var withdraw:Bool
    
    //initialize the properities
    init(accountId: Int, clientId: Int, accountType: String, amount: Double, withdraw:Bool){
        self.accountId = accountId
        self.clientId = clientId
        self.accountType = accountType
        self.amount = amount
        self.withdraw = withdraw
    }

    // Display the current balllance
    func getBalance() -> Double {
        return self.amount
    }
    
    // Deposit money to account
    func addMoney(sum: Double) {
        self.amount = self.amount + sum
        //todo: add update to file
    }
    
    // Draw the money from the account
    func takeMoney(sum: Double) {
        self.amount = self.amount - sum
        //todo: add update to file
    }
    
    // transfer the money to other account
    func transferMoney(sum: Double, acc: Account) {
        self.amount = self.amount - sum
        acc.amount = acc.amount + sum
        //todo: add update to file
    }
    
    //prints the information about this account
    func printDetails(){
        print("accountId:\(self.accountId)    clientId:\(self.clientId)   accountType:\(self.accountType)   amount:\(self.amount)   withdraw:\(self.withdraw)")
    }
    
    //MARK: File Utility Functions of Account
    func fileRepresentation() -> String {
        return "\(accountId),\(clientId),\(accountType),\(amount),\(withdraw)\n"
    }
    
    static func parseFileRepresentation(str: String) -> Account {
        let tokenized = str.components(separatedBy: ",")
        return Account(accountId: Int(tokenized[0])!, clientId: Int(tokenized[1])!, accountType: tokenized[2], amount: Double(tokenized[3])!, withdraw: Bool(tokenized[4])!)
    //---------------------------------------------
    }
}

