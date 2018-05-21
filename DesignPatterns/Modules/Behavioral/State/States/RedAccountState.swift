//
//  RedAccountState.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

// MARK: Concrete state

class RedAccountState: AccountState {
    override init(account: Account, balance: Double) {
        super.init(account: account, balance: balance)
        
        set(interest: 0.0, lowerLimit: -1000000.0, upperLimit: 0.0)
    }
    
    override func changeStateIfNeeded() {
        if balance > upperLimit {
            let silverAccountState = SilverAccountState(account: account, balance: balance)
            
            if balance > silverAccountState.upperLimit {
                account.state = GoldAccountState(account: account, balance: balance)
            } else {
                account.state = silverAccountState
            }
        }
    }
}
