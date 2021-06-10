//
//  AccountUtility.swift
//  final_project_bank
//
//  Created by Sheamuss on 10.06.2021.
//

import Foundation

class AccountUtil {
    static var fileUtil = FileUtil()
    static func getAccounts() -> [Account] {
        var accounts = [Account]()
        let lines = fileUtil.readLines().filter { strToFilter in
             strToFilter != ""
        }
        
        for line in lines {
            let account = Account.parseFileRepresentation(str: line)
            accounts.append(account)
        }
        return accounts
    }
    
    private static func convertToStringAndSave(accounts: [Account]) {
        var strToSave = ""
        
        for account in accounts {
            strToSave += account.fileRepresentation()
        }
        fileUtil.writeToFile(str: strToSave)
    }
    
    static func saveAccount(accountToSave: Account) {
        var accounts = AccountUtil.getAccounts()
        for (index, account) in  accounts.enumerated() {
            if account.accountId == accountToSave.accountId {
                //Update current Account
                accounts.remove(at: index)
                break
            }
        }
        accounts.append(accountToSave)
        
        AccountUtil.convertToStringAndSave(accounts: accounts)
        
    }
    
    static func deleteAccount(accountId: Int) {
        var accounts = AccountUtil.getAccounts()
        for (index, account) in accounts.enumerated() {
            if account.accountId == accountId {
                //Update current Account
                accounts.remove(at: index)
                break
            }
        }
        
        AccountUtil.convertToStringAndSave(accounts: accounts)
        
    }
}
