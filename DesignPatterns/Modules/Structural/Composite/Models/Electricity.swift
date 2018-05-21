//
//  Electricity.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Electricity: Payable {
    private let rate: Float
    private let power: Float
    
    var price: Float {
        return rate * power
    }
    
    init(rate: Float, power: Float) {
        self.rate = rate
        self.power = power
    }
}
