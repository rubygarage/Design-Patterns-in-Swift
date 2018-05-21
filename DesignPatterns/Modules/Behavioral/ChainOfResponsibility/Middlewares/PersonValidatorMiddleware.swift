//
//  PersonValidatorMiddleware.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class PersonValidatorMiddleware: Middleware {
    override func check(value: Any) -> Bool {
        guard let person = value as? Person else {
            return false
        }
        
        return person.firstName.isEmpty || person.lastName.isEmpty ? false : checkNext(value: person)
    }
}
