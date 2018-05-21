//
//  OrderItem.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct OrderItem {
    var dish: Dish
    var count: Int
    
    init(dish: Dish, count: Int = 1) {
        self.dish = dish
        self.count = count
    }
}
