//
//  UserDefaultsDataSource.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class UserDefaultsDataSource: DataSource {
    private let userDefaultsKey: String
    
    init(userDefaultsKey: String) {
        self.userDefaultsKey = userDefaultsKey
    }
    
    // MARK: - DataSource
    
    func writeData(_ data: Any) {
        UserDefaults.standard.set(data, forKey: userDefaultsKey)
    }
    
    func readData() -> Any {
        return UserDefaults.standard.value(forKey: userDefaultsKey)!
    }
}
