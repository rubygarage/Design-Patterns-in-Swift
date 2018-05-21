//
//  Rent.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Rent: Payable {
    private let electricity: Electricity
    private let water: Water
    
    var price: Float {
        return electricity.price + water.price
    }
    
    init(electricity: Electricity, water: Water) {
        self.electricity = electricity
        self.water = water
    }
}
