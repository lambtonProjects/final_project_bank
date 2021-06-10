//
//  SavingAccount.swift
//  final_project_bank
//
//  Created by Sheamuss on 9.06.2021.
//

import Foundation

class SavingAccount: Account {
    var interest:Double
    
    init(accountId: Int, clientId: Int, accountType: String, amount: Double, interest:Double) {
        self.interest=interest
        super.init(accountId: accountId, clientId: clientId, accountType: "savings", amount: amount, withdraw:false)
    }
    override func printDetails() {
        super.printDetails()
        print("interest:\(self.interest)")
    }
}
