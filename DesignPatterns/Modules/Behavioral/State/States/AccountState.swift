//
//  AccountState.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

// MARK: Base state

class AccountState: NSObject {
    private(set) var interest: Double!
    private(set) var lowerLimit: Double!
    private(set) var upperLimit: Double!
    
    var account: Account
    var balance: Double

    init(account: Account, balance: Double) {
        self.account = account
        self.balance = balance
    }
    
    func set(interest: Double, lowerLimit: Double, upperLimit: Double) {
        self.interest = interest
        self.lowerLimit = lowerLimit
        self.upperLimit = upperLimit
    }
    
    func deposit(_ amount: Double) {
        balance += amount
        
        changeStateIfNeeded()
    }

    func withdraw(_ amount: Double) {}
    func payInterest() {}
    func changeStateIfNeeded() {}
}
