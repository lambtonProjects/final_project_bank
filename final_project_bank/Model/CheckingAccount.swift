//
//  CheckingAccount.swift
//  final_project_bank
//
//  Created by Sheamuss on 9.06.2021.
//

import Foundation

class CheckingAccount: Account {
    var fees: Double
    init(accountId: Int, clientId: Int, accountType: String, amount: Double, fees: Double) {
        self.fees = fees
        super.init(accountId: accountId, clientId: clientId, accountType: "checking", amount: amount, withdraw:true)
    }
    override func printDetails() {
        super.printDetails()
        print("fees:\(self.fees)")
    }
}
