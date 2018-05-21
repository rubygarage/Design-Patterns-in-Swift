//
//  Water.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Water: Payable {
    private let rate: Float
    private let amount: Float
    
    var price: Float {
        return rate * amount
    }
    
    init(rate: Float, amount: Float) {
        self.rate = rate
        self.amount = amount
    }
}
