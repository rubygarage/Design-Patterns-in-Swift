//
//  UserManager.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class UserManager {
    static let sharedInstance = UserManager()
    
    var email: String?
    
    private init() {}
}
