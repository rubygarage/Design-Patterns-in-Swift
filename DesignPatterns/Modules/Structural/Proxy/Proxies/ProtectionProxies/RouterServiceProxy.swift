//
//  RouterServiceProxy.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class RouterServiceProxy: RouterConfigurator {
    private let accessUsername = "admin"
    private let accessPassword = "admin"
    
    // MARK: Real service
    
    private var routerService: RouterService
    private var isHaveAccess = false
    
    var name: String? {
        return isHaveAccess ? routerService.name : nil
    }
    var password: String? {
        return isHaveAccess ? routerService.password : nil
    }
    
    init(routerService: RouterService) {
        self.routerService = routerService
    }
    
    // MARK: Gets access to real service
    
    func login(with username: String, password: String) -> Bool {
        let success = username == accessUsername && password == accessPassword
        isHaveAccess = success
        
        return success
    }
    
    func logout() {
        isHaveAccess = false
    }
    
    func change(name: String, password: String) {
        
        // MARK: Checks access before changes router's wireless settings
        
        if isHaveAccess {
            routerService.change(name: name, password: password)
        }
    }
}
