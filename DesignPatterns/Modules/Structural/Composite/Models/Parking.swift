//
//  Parking.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Parking: Payable {
    var price: Float
    
    init(price: Float) {
        self.price = price
    }
}
