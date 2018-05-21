//
//  Account.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Account {
    
    // MARK: State of context
    
    var state: AccountState!
    
    var balance: Double {
        return state.balance
    }

    init() {
        self.state = SilverAccountState(account: self, balance: 0.0)
    }
    
    func deposit(_ amount: Double) {
        state.deposit(amount)
    }
    
    func withdraw(_ amount: Double) {
        state.withdraw(amount)
    }
    
    func payInterest() {
        state.payInterest()
    }
}
