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
    var clientName: String
    var accountType: String
    var amount: Double
    
    //initialize the properities
    init(accountId: Int, clientId: Int, clientName: String, accountType: String, amount: Double){
        self.accountId = accountId
        self.clientId = clientId
        self.clientName = clientName
        self.accountType = accountType
        self.amount = amount
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
}
