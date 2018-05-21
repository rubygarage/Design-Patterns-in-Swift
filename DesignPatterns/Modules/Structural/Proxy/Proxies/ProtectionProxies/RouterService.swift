//
//  RouterService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class RouterService: RouterConfigurator {
    private let wirelessNameKey = "wirelessName"
    private let wirelessPasswordKey = "wirelessPassword"
    
    private var wirelessName: String? {
        get {
            return UserDefaults.standard.value(forKey: wirelessNameKey) as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: wirelessNameKey)
        }
    }
    private var wirelessPassword: String? {
        get {
            return UserDefaults.standard.value(forKey: wirelessPasswordKey) as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: wirelessPasswordKey)
        }
    }
    
    var name: String? {
        return wirelessName
    }
    var password: String? {
        return wirelessPassword
    }
    
    func change(name: String, password: String) {
        wirelessName = name
        wirelessPassword = password
    }
}
