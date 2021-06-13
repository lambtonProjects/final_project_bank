//
//  CheckingAccount.swift
//  final_project_bank
//
//  Created by Sheamuss on 9.06.2021.
//

import Foundation

class CheckingAccount: Account {
    
    init(accountId: Int, clientId: Int) {
        super.init(accountId: accountId, clientId: clientId, accountType: "checking", amount: 0.0, withdraw:true)
    }
 
}
