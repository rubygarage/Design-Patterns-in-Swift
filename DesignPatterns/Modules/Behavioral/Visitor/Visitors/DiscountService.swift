//
//  DiscountService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/10/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

// MARK: Concrete visitor

class DiscountService: DiscountVisitor {
    private var smartphoneDiscount: Double
    private var smartphoneLowerYear: Int
    private var smartwatchDiscount: Double
    private var smartwatchLowerGeneration: Int
    
    private(set) var discount: Double = 0.0
    
    init(smartphoneDiscount: Double, smartphoneLowerYear: Int, smartwatchDiscount: Double, smartwatchLowerGeneration: Int) {
        self.smartphoneDiscount = smartphoneDiscount
        self.smartphoneLowerYear = smartphoneLowerYear
        self.smartwatchDiscount = smartwatchDiscount
        self.smartwatchLowerGeneration = smartwatchLowerGeneration
    }
    
    func visit(_ smartphone: Smartphone) {
        if smartphone.year <= smartphoneLowerYear {
            discount += smartphoneDiscount
        }
    }
    
    func visit(_ smartwatch: Smartwatch) {
        if smartwatch.generation <= smartwatchLowerGeneration {
            discount += smartwatchDiscount
        }
    }
}
