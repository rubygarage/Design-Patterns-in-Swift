
//
//  SortStrategy.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol SortStrategy: class {
    func sort<T: Comparable>(_ array: [T]) -> [T]
}
