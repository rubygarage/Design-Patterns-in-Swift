//
//  RandomNumberGenerator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/4/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct RandomNumberGenerator {
    static func int(_ range: Range<Int>) -> Int {
        return range.lowerBound + Int(arc4random_uniform(UInt32(range.upperBound - range.lowerBound)))
    }
}
