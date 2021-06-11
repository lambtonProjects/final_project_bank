//
//  main.swift
//  project
//
//  Created by Tatiana Ozerskaya on 09/06/2021.
//

import Foundation
var optBw = true
var optCl = true
var userList = [User]()

//Funtion to create a new Client or User*
func createClient(){
    print("Insert identified number:")
    let userId=Int(readLine()!)!
    print("Insert Name:")
    let name=readLine()!
    print("Choose:\n1.Client\n2.User")
    if Int(readLine()!)! == 1{
        print("Enter Phone:")
        let phone=Int(readLine()!)!
        print("Enter Address:")
        let address=readLine()!
        
        let client=Client(userId: userId, userName: name, phone: phone, address: address)
        ClientUtil.saveClient(clientToSave: client)
        //userList.append(Client(userId: userId, userName: name, phone: phone, address: address))
    }else{
        print("Enter Alias:")
        let alias=readLine()!
        userList.append(Operator(userId: userId, userName: name, alias: alias))
    }
}

////Function to update a user that already exists
//func updateClient(userList:[Client]){
//
//
//}

//Function to create account for a user that already exists
func createBankAcount(client: Client){
    let initBalance = 0.0
    print("Insert account identified number:")
    let accountId=Int(readLine()!)!
    
    print("Choose:\n1.Checkings\n2.Savings")
    if Int(readLine()!)! == 1{
        let account=CheckingAccount(accountId: accountId, clientId: client.userId, amount: initBalance)
        AccountUtil.saveAccount(accountToSave: account)
    }else{
        let account = SavingAccount(accountId: accountId, clientId: client.userId, amount: initBalance)
        AccountUtil.saveAccount(accountToSave: account)
    }
}

func findUser(number:Int, clientList:[User])->User!{
    for client in clientList {
        if client.userId == number {
            return client
        }
    }
    return nil
}

//Func to find one especific account with the client information
func findAccountBy(client: Client){
    let accountList = AccountUtil.getAccounts()
    for account in accountList {
        if account.clientId == client.userId {
            print("Accounts 💵")
            account.printDetails()
        }
    }
}

//Func to find one especific account with the account number and show all information aviable including balance
func findAccountBy(number:Int){
    let accountList = AccountUtil.getAccounts()
    for account in accountList {
        let accountId = account.accountId
        if accountId == number {
            print("\nAccount Info ℹ️")
            account.printDetails()
            print("Statements 💵")
            print("transactionId       transactionType     accountId           amount")
            listTransaction(accountId : accountId)
        }else{
            print("⚠️This account does not exist⚠️")
        }
    }
}

//Func to list all transacctions given account ID
func listTransaction(accountId : Int){
    let transactionList = TransactionUtil.getTransacctions()
    for transaction in transactionList {
        if transaction.accountId == accountId {
            transaction.printDetails()
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
        print("5. Show details of a client")
        print("6. Show details/transactions of a account")
        print("7. Exit")
        print("///////////////////////////////////////////////////////////////////////")
        print("Choose...")
        let menu = Int(readLine()!)!
        switch menu {
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
                    //updateCliente()
                }else{
                    print("the identifier number is not from a client ⛔️\n")
                }
            }else{
                print("the client does not exist ⛔️\n")
            }
        case 3:
            print("Find identified number: ")
            let no=Int(readLine()!)!
            let clientList = ClientUtil.getClients()
            
            let client=findUser(number: no, clientList: clientList)
            if client != nil {
                client?.printDetails()
                if client is Client {
                    createBankAcount(client: client! as! Client)
                }else{
                    print("the identifier number is not from a client ⛔️\n")
                }
            }else{
                print("the client does not exist ⛔️\n")
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
                    print("the identifier number is not from a client ⛔️\n")
                }
            }else{
                print("the client does not exist ⛔️\n")
            }
        case 6: //Show details/transactions of a account
            print("Find identified account number: ")
            let no=Int(readLine()!)!
            findAccountBy(number: no)
        case 7:
            optBw = false
        default:
            print("Wrong Option⛔️")
        }
    }while optBw == true
}

func getClientAccounts(arrAccounts: [Account], clientId: Int) -> [Account] {
    var accListForUser = [Account]()
    for i in arrAccounts {
        if i.clientId == clientId {
            accListForUser.append(i)
        }
    }
    return accListForUser
}

func findAccountByNumber(no: Int) -> Account{
    let accountList = AccountUtil.getAccounts()
    var acc = Account(accountId: 0, clientId: 0, accountType: "", amount: 0, withdraw: false)
    for account in accountList {
        if account.accountId == no {
            acc = account
        }
    }
    return acc
}

func clientOption(){
    repeat{
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
                    print("You have no accounts")
                    optCl = false
                } else {
                    let clientAccounts = getClientAccounts(arrAccounts: accArray, clientId: clientNo)
                    for item in clientAccounts {
                        item.printDetails()
                    }
                    print("Enter the account number, that you wants to work with:")
                    let accNo = Int(readLine()!)!
                    let account = findAccountByNumber(no: accNo)
                    print("///////////////////////////📋 Menu Client 📋///////////////////////////")
                    print("1. Get account details")
                    print("2. Deposit")
                    print("3. Withdraw")
                    print("4. Transfer to another account")
                    print("5. Pay Bill")
                    print("6. Exit")
                    print("///////////////////////////////////////////////////////////////////////")
                    print("Choose the operation")
                    let menu = Int(readLine()!)!
                    switch menu {
                    case 1:
                        print("Get account details")
                        print("Your current balance is: ",account.getBalance())
                    case 2:
                        print("Deposit the money")
                        print("Please Enter the amount:")
                        let depAmount = Double(readLine()!)!
                        account.addMoney(sum: depAmount)
                        AccountUtil.saveAccount(accountToSave: account)
                    case 3:
                        print("Draw the money")
                        print("Please Enter the amount:")
                        let withdrowAmount = Double(readLine()!)!
                        account.takeMoney(sum: withdrowAmount)
                        AccountUtil.saveAccount(accountToSave: account)
                    case 4:
                        print("Transfer the money to another account")
                        print("Please Enter the account number to which to transfer:")
                        let trAccNo = Int(readLine()!)!
                        let trAcc = findAccountByNumber(no: trAccNo)
                        print("Please Enter the amount to transfer:")
                        let trAmount = Double(readLine()!)!
                        account.transferMoney(sum: trAmount, acc: trAcc)
                        AccountUtil.saveAccount(accountToSave: account)
                        AccountUtil.saveAccount(accountToSave: trAcc)
                    case 5:
                        print("Pay Bill")
                        //print("Please Enter the number of the bill:")
                        //let billNumber = Double(readLine()!)!
                        print("Please Enter the amount of the bill:")
                        let withdrowAmount = Double(readLine()!)!
                        account.takeMoney(sum: withdrowAmount)
                        AccountUtil.saveAccount(accountToSave: account)
                    case 6:
                        optCl = false
                    default:
                        print("Wrong Option⛔️")
                    }
                }
                
            }
        } else {
                print("This client number does not exists in the system")
            }
        
    } while optCl == true
}

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
    print("Do you want enter whith another User? yes/no")
}while(readLine()!=="yes")
print("Thanks... 😊")

/*
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
//
//let account = Account(accountId: 1, clientId: 1, accountType: "Saving", amount: 100000, withdraw: true)
//let account2 = Account(accountId: 2, clientId: 1, accountType: "Checking", amount: 1000, withdraw: true)
//let account3 = Account(accountId: 3, clientId: 1, accountType: "Saving", amount: 256000, withdraw: true)
//let account4 = Account(accountId: 4, clientId: 1, accountType: "Saving", amount: 256000, withdraw: true)

//AccountUtil.saveAccount(accountToSave: account)
//AccountUtil.saveAccount(accountToSave: account2)
//AccountUtil.saveAccount(accountToSave: account3)
//AccountUtil.saveAccount(accountToSave: account4)
