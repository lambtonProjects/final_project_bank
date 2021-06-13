//
//  SavingAccount.swift
//  final_project_bank
//
//  Created by Sheamuss on 9.06.2021.
//

import Foundation

class SavingAccount: Account {
    
    init(accountId: Int, clientId: Int) {
        super.init(accountId: accountId, clientId: clientId, accountType: "savings", amount: 0.0, withdraw:false)
    }
}
