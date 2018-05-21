//
//  DataSourceDecorator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class DataSourceDecorator: DataSource {
    
    // MARK: Data source that should be wrapped
    
    let wrappee: DataSource
    
    init(wrappee: DataSource) {
        self.wrappee = wrappee
    }
    
    // MARK: - DataSource
    
    func writeData(_ data: Any) {
        wrappee.writeData(data)
    }
    
    func readData() -> Any {
        return wrappee.readData()
    }
}
