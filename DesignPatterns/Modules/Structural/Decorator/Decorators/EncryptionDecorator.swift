//
//  EncryptionDecorator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class EncryptionDecorator: DataSourceDecorator {
    private let encryptionKey: String
    
    init(wrappee: DataSource, encryptionKey: String) {
        self.encryptionKey = encryptionKey
        
        super.init(wrappee: wrappee)
    }
    
    override func writeData(_ data: Any) {
        
        // MARK: Encrypts string before writes it
        
        let encryptedString = encryptString(data as! String)
        wrappee.writeData(encryptedString)
    }
    
    override func readData() -> Any {
        
        // MARK: Decrypts string after reads it
        
        let encryptedString = wrappee.readData() as! String
        
        return decryptString(encryptedString)
    }
    
    private func encryptString(_ string: String) -> String {
        let stringBytes = [UInt8](string.utf8)
        let keyBytes = [UInt8](encryptionKey.utf8)
        var encryptedBytes: [UInt8] = []
        
        for stringByte in stringBytes.enumerated() {
            encryptedBytes.append(stringByte.element ^ keyBytes[stringByte.offset % encryptionKey.count])
        }
        
        return String(bytes: encryptedBytes, encoding: .utf8)!
    }
    
    private func decryptString(_ string: String) -> String {
        let stringBytes = [UInt8](string.utf8)
        let keyBytes = [UInt8](encryptionKey.utf8)
        var decryptedBytes: [UInt8] = []
        
        for stringByte in stringBytes.enumerated() {
            decryptedBytes.append(stringByte.element ^ keyBytes[stringByte.offset % encryptionKey.count])
        }
        
        return String(bytes: decryptedBytes, encoding: .utf8)!
    }
}
