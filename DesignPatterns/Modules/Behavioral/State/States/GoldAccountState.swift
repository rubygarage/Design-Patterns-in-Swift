//
//  GoldAccountState.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

// MARK: Concrete state

class GoldAccountState: AccountState {
    override init(account: Account, balance: Double) {
        super.init(account: account, balance: balance)
        
        set(interest: 0.05, lowerLimit: 1000.0, upperLimit: 1000000)
    }
    
    override func withdraw(_ amount: Double) {
        balance -= amount
        
        changeStateIfNeeded()
    }
    
    override func payInterest() {
        balance += interest * balance
        
        changeStateIfNeeded()
    }
    
    override func changeStateIfNeeded() {
        let silverAccountState = SilverAccountState(account: account, balance: balance)
        
        if balance < silverAccountState.lowerLimit {
            account.state = RedAccountState(account: account, balance: balance)
        } else if balance < lowerLimit {
            account.state = silverAccountState
        }
    }
}
