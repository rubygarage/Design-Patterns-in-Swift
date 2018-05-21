//
//  Visitor.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/10/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol DiscountVisitor: class {
    func visit(_ smartphone: Smartphone)
    func visit(_ smartwatch: Smartwatch)
}
