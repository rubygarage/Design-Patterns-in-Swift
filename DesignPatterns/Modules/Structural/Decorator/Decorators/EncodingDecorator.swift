//
//  EncodingDecorator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class EncodingDecorator: DataSourceDecorator {
    private let encoding: String.Encoding
    
    init(wrappee: DataSource, encoding: String.Encoding) {
        self.encoding = encoding
        
        super.init(wrappee: wrappee)
    }
    
    override func writeData(_ data: Any) {
        
        // MARK: Encodes string before writes it
        
        let stringData = (data as! String).data(using: encoding)!
        wrappee.writeData(stringData)
    }
    
    override func readData() -> Any {
        
        // MARK: Decodes string after reads it
        
        let data = wrappee.readData() as! Data

        return String(data: data, encoding: encoding)!
    }
}
