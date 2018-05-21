//
//  SortedArray.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct SortedArray<T: Comparable> {
    private(set) var array: [T] = []
    
    // MARK: Stratgy of context
    
    var sortStrategy: SortStrategy?
    
    mutating func add(_ value: T) {
        array.append(value)
    }
    
    mutating func clear() {
        array.removeAll()
    }
    
    mutating func sort() {
        if let sortStrategy = sortStrategy {
            array = sortStrategy.sort(array)
        }
    }
}
