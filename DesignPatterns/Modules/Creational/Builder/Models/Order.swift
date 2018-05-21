//
//  Order.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct Order {
    var firstCourses: [OrderItem] = []
    var mainCourses: [OrderItem] = []
    var garnishes: [OrderItem] = []
    var drinks: [OrderItem] = []
    var tips: Float = 0.0
}
