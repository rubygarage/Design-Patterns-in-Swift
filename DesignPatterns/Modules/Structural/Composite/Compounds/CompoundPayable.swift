//
//  CompoundPayable.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class CompoundPayable: Payable {
    
    // MARK: All leafs of tree
    
    private var children: [Payable] = []
    
    var price: Float {
        
        // MARK: Gets price of all leafs
        
        return children.map { $0.price }.reduce(0, +)
    }
    
    func add(_ payable: Payable) {
        children.append(payable)
    }
    
    func remove(_ payable: Payable) {
        if let index = children.index(where: { $0 === payable}) {
            children.remove(at: index)
        }
    }
}
