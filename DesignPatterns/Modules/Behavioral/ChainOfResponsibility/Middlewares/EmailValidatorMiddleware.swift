//
//  EmailValidatorMiddleware.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class EmailValidatorMiddleware: Middleware {
    private let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    private lazy var emailPredicate: NSPredicate = {
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    }()
    
    override func check(value: Any) -> Bool {
        guard let email = value as? String else {
            return false
        }
        
        return emailPredicate.evaluate(with: email) ? checkNext(value: email) : false
    }
}
