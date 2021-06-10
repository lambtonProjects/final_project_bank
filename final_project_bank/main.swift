//
//  main.swift
//  project
//
//  Created by Tatiana Ozerskaya on 09/06/2021.
//

import Foundation

 
// main function

/* ask from user which type of user he is:
 1 = bank worker
 2 = client
 
 for client: show the menu:
 
 1 - get account details -- by accountId or by clientId
 2 - deposit the money to specific account (by accountId)
 3 - draw the money from specific account (by accountId)
 4 - transfer the money to another account
 5 - pay the bills
 
 
 for bank worker:
 
 1 - create an account (ask all data) - save to file
 2 - update the user - save to file
 3 - get account details -- by accountId or by clientId
 4 - deposit the money to specific account (by accountId)
 5 - draw the money from specific account (by accountId)
 6 - transfer the money to another account
 7 - pay the bills
 */

let account = Account(accountId: 1, clientId: 1, clientName: "Test", accountType: "Saving", amount: 100000)
let account2 = Account(accountId: 2, clientId: 1, clientName: "Test2", accountType: "Checking", amount: 1000)
let account3 = Account(accountId: 3, clientId: 1, clientName: "Hello", accountType: "Saving", amount: 256000)
let account4 = Account(accountId: 4, clientId: 1, clientName: "Mercedes", accountType: "Saving", amount: 256000)



AccountUtil.saveAccount(accountToSave: account)
AccountUtil.saveAccount(accountToSave: account2)
AccountUtil.saveAccount(accountToSave: account3)
AccountUtil.saveAccount(accountToSave: account4)
