//
//  Middleware.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Middleware {
    private var next: Middleware?
    
    // MARK: Links few middleware
    
    func linkWith(_ next: Middleware) -> Middleware {
        self.next = next
        
        return next
    }
    
    func check(value: Any) -> Bool {
        return true
    }
    
    func checkNext(value: Any) -> Bool {
        guard let next = next else {
            return true
        }
        
        return next.check(value: value)
    }
}
