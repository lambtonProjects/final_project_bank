//
//  ClientUtil.swift
//  final_project_bank
//
//  Created by Omairys Uzcátegui on 2021-06-10.
//

import Foundation

class ClientUtil {
    static var fileUtil = FileUtil(nameFile: "client.txt")
    
    static func getClients() -> [Client] {
        var clients = [Client]()
        let lines = fileUtil.readLines().filter { strToFilter in
             strToFilter != ""
        }
        
        for line in lines {
            let client = Client.parseFileRepresentation(str: line)
            clients.append(client)
        }
        return clients
    }
    
    private static func convertToStringAndSave(clients: [Client]) {
        var strToSave = ""
        for client in clients {
            strToSave += client.fileRepresentation()
        }
        fileUtil.writeToFile(str: strToSave)
    }
    
    static func saveClient(clientToSave: Client){
        print("\nSave client here..💾")
        var clients = ClientUtil.getClients()
        for (index, client) in  clients.enumerated() {
            if client.userId == clientToSave.userId {
                //Update current Account
                clients.remove(at: index)
                break
            }
        }
        clients.append(clientToSave)
        ClientUtil.convertToStringAndSave(clients: clients)
    }
    
}
