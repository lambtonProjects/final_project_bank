//
//  SavingAccount.swift
//  final_project_bank
//
//  Created by Sheamuss on 9.06.2021.
//

import Foundation

class SavingAccount: Account {
    var interest = 0.01
    
    init(accountId: Int, clientId: Int) {
        //self.interest=interest
        super.init(accountId: accountId, clientId: clientId, accountType: "savings", amount: 0.0, withdraw:false)
    }
    override func printDetails() {
        super.printDetails()
        print("interest:\(self.interest)")
    }
}
