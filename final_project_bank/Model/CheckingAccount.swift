//
//  CheckingAccount.swift
//  final_project_bank
//
//  Created by Sheamuss on 9.06.2021.
//

import Foundation

class CheckingAccount: Account {
    var fees = 0.05
    
    init(accountId: Int, clientId: Int) {
        //self.fees = fees
        super.init(accountId: accountId, clientId: clientId, accountType: "checking", amount: 0.0, withdraw:true)
    }
    override func printDetails() {
        super.printDetails()
        print("fees:\(self.fees)")
    }
}
