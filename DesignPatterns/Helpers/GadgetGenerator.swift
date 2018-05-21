//
//  GadgetGenerator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/10/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct GadgetGenerator {
    static var gadgets: [VisitorComponent] {
        return [Smartphone(brand: "Pear", model: "6M", year: 2013, price: 100.0),
                Smartphone(brand: "Threesons", model: "M9", year: 2018, price: 300.0),
                Smartwatch(brand: "Muzei", generation: 2, year: 2016, price: 50.0),
                Smartwatch(brand: "Mixiao", generation: 3, year: 2017, price: 80.0)]
    }
}
