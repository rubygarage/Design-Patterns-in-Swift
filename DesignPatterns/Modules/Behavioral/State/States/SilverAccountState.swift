//
//  SilverAccountState.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

// MARK: Concrete state

class SilverAccountState: AccountState {
    override init(account: Account, balance: Double) {
        super.init(account: account, balance: balance)
        
        set(interest: 0.0, lowerLimit: 0.0, upperLimit: 1000.0)
    }
    
    override func withdraw(_ amount: Double) {
        balance -= amount
        
        changeStateIfNeeded()
    }
    
    override func changeStateIfNeeded() {
        if balance < lowerLimit {
            account.state = RedAccountState(account: account, balance: balance)
        } else if balance > upperLimit {
            account.state = GoldAccountState(account: account, balance: balance)
        }
    }
}
