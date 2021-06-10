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

//Funtion to create a new Client
func createClient(){
    print("Enter identified number:")
    let userId=Int(readLine()!)!
    print("Enter Name:")
    let name=readLine()!
    print("Choose:\n1.Client\n2.User")
    if Int(readLine()!)! == 1{
        print("Enter Phone:")
        let phone=Int(readLine()!)!
        print("Enter Address:")
        let address=readLine()!
        userList.append(Client(userId: userId, userName: name, phone: phone, address: address))
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
func createBankAcount(){
    print("Crear Cuenta, ahora si!")
}

func findUser(number:Int, userList:[User])->User!{
    for user in userList {
        if user.userId == number {
            return user
        }
    }
    return nil
}

func bankWorkerOption(){
    repeat{
        print("////////////////////////📋 Menu Bank Worker 📋/////////////////////////")
        print("1. Create a New User")
        print("2. Update Client")
        print("3. Create Bank Account")
        print("4. Exit")
        print("///////////////////////////////////////////////////////////////////////")
        print("Choose...")
        let menu = Int(readLine()!)!
        switch menu {
        case 1:
            createClient()
        case 2:
            print("Find identified number: ")
            let no=Int(readLine()!)!
            let client=findUser(number: no, userList: userList)
            if client != nil {
                client?.printDetails()
                if client!.isClient {
                    //updateCliente()
                }else{
                    print("the identifier number is not from a client ⛔️")
                }
            }else{
                print("the client does not exist ⛔️")
            }
        case 3:
            print("Find identified number: ")
            let no=Int(readLine()!)!
            let client=findUser(number: no, userList: userList)
            if client != nil {
                client?.printDetails()
                if client!.isClient {
                    //createBankAcount()
                }else{
                    print("the identifier number is not from a client ⛔️")
                }
            }else{
                print("the client does not exist ⛔️")
            }
        case 4:
            optBw = false
        default:
            print("Wrong Option⛔️")
        }
    }while optBw == true
}

func clientOption(){
    repeat{
        print("///////////////////////////📋 Menu Client 📋///////////////////////////")
        print("1. Get account details")
        print("2. Deposit")
        print("3. Withdraw")
        print("4. Transfer to another account")
        print("5. Pay Bill")
        print("6. Exit")
        print("///////////////////////////////////////////////////////////////////////")
        print("Choose...")
        let menu = Int(readLine()!)!
        switch menu {
        case 1:
            print("Get account details")
        case 2:
            print("Deposit the money")
        case 3:
            print("Draw the money")
        case 4:
            print("Transfer the money to another account")
        case 5:
            print("Pay Bill")
        case 6:
            optCl = false
        default:
            print("Wrong Option⛔️")
        }

    }while optCl == true
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

let account = Account(accountId: 1, clientId: 1, accountType: "Saving", amount: 100000, withdraw: true)
let account2 = Account(accountId: 2, clientId: 1, accountType: "Checking", amount: 1000, withdraw: true)
let account3 = Account(accountId: 3, clientId: 1, accountType: "Saving", amount: 256000, withdraw: true)
let account4 = Account(accountId: 4, clientId: 1, accountType: "Saving", amount: 256000, withdraw: true)



AccountUtil.saveAccount(accountToSave: account)
AccountUtil.saveAccount(accountToSave: account2)
AccountUtil.saveAccount(accountToSave: account3)
AccountUtil.saveAccount(accountToSave: account4)
