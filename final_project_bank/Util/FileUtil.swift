//
//  FileUtil.swift
//  final_project_bank
//
//  Created by Sheamuss on 9.06.2021.
//

import Foundation

class FileUtil {
    var localFileUrl : URL?
    
    private static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    init(nameFile: String) {
        localFileUrl = FileUtil.getDocumentsDirectory().appendingPathComponent(nameFile)
    }
    
    
    func writeToFile(str : String) {
        do {
            try str.write(to: localFileUrl!, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("⚠️ Writing Problem: Possible Causes: Please check permissions, folder existence etc. ⚠️")
        }
    }
    
     func readLines() -> [String] {
        do {
            let data = try String(contentsOf: localFileUrl!, encoding: .utf8)
            let lines = data.components(separatedBy: .newlines)
            return lines
        } catch {
            print("⚠️ Writing Warning: Empty file or doesn't exist. ⚠️")
            return []
        }
    }
    
    
}
