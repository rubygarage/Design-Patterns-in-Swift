//
//  Order+Details.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

extension Order {
    var price: Float {
        let items = firstCourses + mainCourses + garnishes + drinks
        return items.reduce(Float(0), { $0 + $1.dish.price * Float($1.count) }) 
    }
}
