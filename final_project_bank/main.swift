//
//  main.swift
//  project
//
//  Created by Tatiana Ozerskaya on 09/06/2021.
//

import Foundation
var optBw = true

//Funtion to create a new Client or User*
func createClient(){
    print("Insert identified number:")
    let userId=Int(readLine()!)!
    print("Insert Name:")
    let name=readLine()!
    print("Enter Phone:")
    let phone=Int(readLine()!)!
    print("Enter Address:")
    let address=readLine()!
    let client=Client(userId: userId, userName: name, phone: phone, address: address)
    ClientUtil.saveClient(clientToSave: client)
    
}

//Function to create account for a user that already exists
func createBankAccount(client: Client){
    let (x,y)=validAcountExist(client: client)
    if x<2 {
        print("Insert account identified number:")
        let accountId=Int(readLine()!)!
        let (a, _)=findAccountBy(number: accountId)
        if a != 0{
            print("⚠️The account identified entered is not available, try another⚠️")
        }else{
            print("Choose:\n1.Checkings\n2.Savings")
            if Int(readLine()!)! == 1{
                if haveChecking(clientAccountList: y) {
                    print("⚠️You exceeded the allowed checking account limit⚠️")
                }else{
                    let account=CheckingAccount(accountId: accountId, clientId: client.userId)
                    AccountUtil.saveAccount(accountToSave: account)
                }
            }else{
                if haveSaving(clientAccountList: y) {
                    print("⚠️You exceeded the allowed Saving account limit⚠️")
                }else{
                    let account = SavingAccount(accountId: accountId, clientId: client.userId)
                    AccountUtil.saveAccount(accountToSave: account)
                }
            }
        }
    }else{
        print("⚠️You exceeded the allowed account limit⚠️")
    }
}

func haveChecking(clientAccountList:[Account]) -> Bool{
    for account in clientAccountList {
        if account.accountType == "checking" {
            return true
        }
    }
    return false
}

func haveSaving(clientAccountList:[Account]) -> Bool{
    for account in clientAccountList {
        if account.accountType == "savings" {
            return true
        }
    }
    return false
}

func findUser(number:Int, clientList:[User])->User!{
    for client in clientList {
        if client.userId == number {
            return client
        }
    }
    return nil
}

//Func to find especific account with the client information and print it
func findAccountBy(client: Client){
    let (x,accountList)=validAcountExist(client: client)
    if x>0 {
        print("Accounts 💵")
        for account in accountList {
            if account.clientId == client.userId {
                account.printDetails()
            }
        }
    }else{
        print("⚠️Client does not have accounts ⚠️")
    }
}

//Func to find a list for a especific client account information and print it
func validAcountExist(client: Client) -> (Int, [Account]){
    var clientAccountList = [Account]()
    let accountList = AccountUtil.getAccounts()
    for account in accountList {
        if account.clientId == client.userId {
            clientAccountList.append(account)
         }
    }
    return (clientAccountList.count, clientAccountList)
}


//Func to find one especific account with the account number and show all information aviable including balance
func findAccountBy(number:Int) -> (Int, [Account]){
    var clientAccountList = [Account]()
    let accountList = AccountUtil.getAccounts()
    for account in accountList {
        if account.accountId == number {
            clientAccountList.append(account)
         }
    }
    return (clientAccountList.count, clientAccountList)
}

func getOneAccount(clientAccountList:[Account], accountId:Int, clientId:Int) -> Account!{
    for account in clientAccountList {
        if account.accountId == accountId && account.clientId == clientId  {
            return account
        }
    }
    return nil
}

//Func to list all transacctions given account ID
func listTransaction(accountId : Int){
    let transactionList = TransactionUtil.getTransacctions()
    var transactionListByAccount = [Transaction]()
    for transaction in transactionList {
        if transaction.accountId == accountId {
            transactionListByAccount.append(transaction)
        }
    }
    if transactionListByAccount.count == 0 {
        print("⚠️This account has no transactions⚠️")
    }else{
        print("Statements 💵")
        print("transactionId       transactionType     accountId           amount")
        for item in transactionListByAccount {
            item.printDetails()
        }
    }
}

func bankWorkerOption(){
    repeat{
        print("////////////////////////📋 Menu Bank Worker 📋/////////////////////////")
        print("1. Create a Client")
        print("2. Update Client")
        print("3. Create Bank Account")
        print("4. List all Clients")
        print("5. List details of a client")
        print("6. List transactions from an account")
        print("7. Exit")
        print("///////////////////////////////////////////////////////////////////////")
        print("Choose...")
        let menu = readLine()!
        switch Int(menu) {
        case 1:
            createClient()
        case 2:
            print("Insert identified number: ")
            let no=Int(readLine()!)!
            let clientList = ClientUtil.getClients()
            
            let client=findUser(number: no, clientList: clientList)
            if client != nil {
                client?.printDetails()
                if client is Client {
                    print("Insert new phone: ")
                    let phone=Int(readLine()!)!
                    print("Insert new Address: ")
                    let address=readLine()!
                    
                    let clientUpdate=Client(userId: client!.userId, userName: client!.userName, phone: phone, address: address)
                    ClientUtil.saveClient(clientToSave: clientUpdate)
                }else{
                    print("⚠️The identifier number is not from a client ⚠️\n")
                }
            }else{
                print("⚠️The client does not exist ⚠️\n")
            }
        case 3:
            print("Find identified number: ")
            let no=Int(readLine()!)!
            let clientList = ClientUtil.getClients()
            let client=findUser(number: no, clientList: clientList)
            
            if client != nil {
                client?.printDetails()
                if client is Client {
                    createBankAccount(client: client! as! Client)
                }else{
                    print("⚠️The identifier number is not from a client ⚠️\n")
                }
            }else{
                print("⚠️The client does not exist ⚠️\n")
            }
        case 4:
            print("List all Client ")
            let clientList = ClientUtil.getClients()
            for client in clientList {
                client.printDetails()
            }
        case 5:
            print("Find identified number: ")
            let no=Int(readLine()!)!
            let clientList = ClientUtil.getClients()
            let client=findUser(number: no, clientList: clientList)
            if client != nil {
                client?.printDetails()
                if client is Client {
                    findAccountBy(client: client! as! Client)
                }else{
                    print("⚠️The identifier number is not from a client ⚠️\n")
                }
            }else{
                print("⚠️The client does not exist ⚠️\n")
            }
        case 6: //Show details/transactions of a account
            print("Find identified account number: ")
            let no=Int(readLine()!)!
            let (x,y)=findAccountBy(number: no)
            if x == 0{
              print("⚠️This account does not exist⚠️")
            }else{
                for item in y {
                    print("\nAccount Info ℹ️")
                    item.printDetails()
                    listTransaction(accountId: item.accountId)
                }
            }
        case 7:
            optBw = false
        default:
            print("Wrong Option⛔️")
        }
    }while optBw == true
}

//func returns array of specific client accounts
func getClientAccounts(arrAccounts: [Account], clientId: Int) -> [Account] {
    var accListForUser = [Account]()
    for i in arrAccounts {
        if i.clientId == clientId {
            accListForUser.append(i)
        }
    }
    return accListForUser
}

//function returns account inctance by account number
func findAccountByNumber(no: Int) -> Account!{
    let accountList = AccountUtil.getAccounts()
    for account in accountList {
        if account.accountId == no {
            return account
        }
    }
    return nil
}

func nextTransaction()->Int{
    return Int.random(in: 0...10000)
}

//func returns all client operations
func clientOption(){
    var optCl = true
    print("Please enter the client number")
    let clientNo = Int(readLine()!)!
    let clientList = ClientUtil.getClients()
    let client = findUser(number: clientNo, clientList: clientList)
    if client != nil {
        if client is Client {
            print("You have logged in successfully!\nWelcome", client?.userName ?? "Unknown","\nHere is the list of your accounts:\n ")
            let accArray = AccountUtil.getAccounts()
            print("/////////////////////////////////////\n")
            if accArray.isEmpty {
                print("⚠️You have no accounts⚠️")
                optCl = false
            } else {
                let clientAccounts = getClientAccounts(arrAccounts: accArray, clientId: clientNo)
                for item in clientAccounts {
                    item.printDetails()
                }
                print("\nEnter the account number, that you wants to work with:")
                let accNo = Int(readLine()!)!
                let (x, acc) = findAccountBy(number: accNo)
                let accOne = getOneAccount(clientAccountList: acc, accountId: accNo, clientId: clientNo)
                if x > 0 && accOne != nil{
                    let account=Account(accountId: accOne!.accountId, clientId: accOne!.clientId, accountType: accOne!.accountType, amount: accOne!.amount, withdraw: accOne!.withdraw)
                    repeat{
                        print("///////////////////////////📋 Menu Client 📋///////////////////////////")
                        print("1. Get account details")
                        print("2. Deposit")
                        print("3. Withdraw")
                        print("4. Transfer to another account")
                        print("5. Pay Bill")
                        print("6. List transactions")
                        print("7. Exit")
                        print("///////////////////////////////////////////////////////////////////////")
                        print("Choose the operation")
                        let menu = readLine()!
                        switch Int(menu) {
                        case 1:
                            print("Get account details")
                            print("Your account number is: ",account.accountId)
                            print("Your account type is: ",account.accountType)
                            print("Your current balance is: ",account.getBalance())
                        case 2:
                            print("Deposit the money")
                            print("Please Enter the amount:")
                            let depAmount = Double(readLine()!)!
                            account.addMoney(sum: depAmount)
                            AccountUtil.saveAccount(accountToSave: account)
                            let transaction = Transaction(accountId: account.accountId, transactionType: "deposit", transactionId: nextTransaction(), amount: depAmount)
                            TransactionUtil.saveTransaction(transactionToSave: transaction)
                        case 3:
                            print("Draw the money")
                            print("Please Enter the amount:")
                            let withdrowAmount = Double(readLine()!)!
                            account.takeMoney(sum: withdrowAmount)
                            AccountUtil.saveAccount(accountToSave: account)
                            let transaction = Transaction(accountId: account.accountId, transactionType: "draw", transactionId: nextTransaction(), amount: withdrowAmount)
                            TransactionUtil.saveTransaction(transactionToSave: transaction)
                        case 4:
                            print("Transfer the money to another account")
                            print("Please Enter the account number to which to transfer:")
                            let trAccNo = Int(readLine()!)!
                            let resp = findAccountByNumber(no: trAccNo)
                            if resp != nil {
                                let trAcc=Account(accountId: resp!.accountId, clientId: resp!.clientId, accountType: resp!.accountType, amount: resp!.amount, withdraw: resp!.withdraw)
                            print("Please Enter the amount to transfer:")
                            let trAmount = Double(readLine()!)!
                            account.transferMoney(sum: trAmount, acc: trAcc)
                            AccountUtil.saveAccount(accountToSave: account)
                            let transactionOut = Transaction(accountId: account.accountId, transactionType: "transfer out", transactionId: nextTransaction(), amount: -trAmount)
                            TransactionUtil.saveTransaction(transactionToSave: transactionOut)
                            
                            AccountUtil.saveAccount(accountToSave: trAcc)
                            let transactionIn = Transaction(accountId: trAccNo, transactionType: "transfer in", transactionId: nextTransaction(), amount: trAmount)
                                TransactionUtil.saveTransaction(transactionToSave: transactionIn)
                            }else{
                                print("⚠️The account you are trying to transfer to, does not exist, bye⚠️")
                            }
                        case 5:
                            print("Pay Bill")
                            print("Please Enter the amount of the bill:")
                            let withdrowAmount = Double(readLine()!)!
                            account.takeMoney(sum: withdrowAmount)
                            AccountUtil.saveAccount(accountToSave: account)
                            let transaction = Transaction(accountId: account.accountId, transactionType: "payment", transactionId: nextTransaction(), amount: withdrowAmount)
                            TransactionUtil.saveTransaction(transactionToSave: transaction)
                        case 6:
                            listTransaction(accountId: accNo)
                        case 7:
                            optCl = false
                        default:
                            print("Wrong Option⛔️")
                        }
                    } while optCl == true
                }else{
                    print("⚠️This account number does not exists in the system for this client⚠️")
                }
            }
        }
    }else {
        print("⚠️This client number does not exists in the system⚠️")
    }
}

// the main function starts here

print("🏢 The Bank 🏢")
repeat{
    // Ask from user which type of user he is:
    print("Enter as:")
    print("1.- Bank Worker")
    print("2.- Client")
    print("Choose...")
    let opt = Int(readLine()!)
    switch opt {
    case 1:
        print("Funtion bankWorker here")
        bankWorkerOption()
    case 2:
        //client funtions
        print("Funtion client here")
        clientOption()
    default:
        print("Wrong Option⛔️")
    }
    print("\nDo you want enter whith another User? yes/no")
}while(readLine()!=="yes")
print("Thanks bye... 😊")
