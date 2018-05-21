//
//  EmptyStringValidatorMiddleware.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class EmptyStringValidatorMiddleware: Middleware {
    override func check(value: Any) -> Bool {
        guard let string = value as? String else {
            return false
        }
        
        return string.isEmpty ? false : checkNext(value: string)
    }
}
