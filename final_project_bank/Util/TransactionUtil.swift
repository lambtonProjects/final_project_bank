//
//  TransactionUtil.swift
//  final_project_bank
//
//  Created by Omairys Uzcátegui on 2021-06-10.
//

import Foundation

class TransactionUtil {
    static var fileUtil = FileUtil(nameFile: "transaction.txt")
    
    static func getTransacctions() -> [Transaction] {
        var transactions = [Transaction]()
        let lines = fileUtil.readLines().filter { strToFilter in
             strToFilter != ""
        }
        
        for line in lines {
            let transaction = Transaction.parseFileRepresentation(str: line)
            transactions.append(transaction)
        }
        return transactions
    }
    
    private static func convertToStringAndSave(transactions: [Transaction]) {
        var strToSave = ""
        for transaction in transactions {
            strToSave += transaction.fileRepresentation()
        }
        fileUtil.writeToFile(str: strToSave)
    }
    
    static func saveTransaction(transactionToSave: Transaction) {
        print("\nSave transaction here.. 💾")
        var transactions = TransactionUtil.getTransacctions()
        for (index, transaction) in  transactions.enumerated() {
            if transaction.transactionId == transactionToSave.transactionId {
                //Update current Account
                transactions.remove(at: index)
                break
            }
        }
        transactions.append(transactionToSave)
        
        TransactionUtil.convertToStringAndSave(transactions: transactions)
    }
        
//    static func deleteAccount(accountId: Int) {
//        var accounts = AccountUtil.getAccounts()
//        for (index, account) in accounts.enumerated() {
//            if account.accountId == accountId {
//                //Update current Account
//                accounts.remove(at: index)
//                break
//            }
//        }
//
//        AccountUtil.convertToStringAndSave(accounts: accounts)
//
//    }
}
