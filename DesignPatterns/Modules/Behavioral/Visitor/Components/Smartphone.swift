//
//  Smartphone.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/10/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Smartphone: VisitorComponent {
    private(set) var brand: String
    private(set) var model: String
    private(set) var year: Int
    private(set) var price: Double
    
    init(brand: String, model: String, year: Int, price: Double) {
        self.brand = brand
        self.model = model
        self.year = year
        self.price = price
    }
    
    // MARK: Uses visitor by component protocol
    
    func accept(_ visitor: DiscountVisitor) {
        visitor.visit(self)
    }
}
