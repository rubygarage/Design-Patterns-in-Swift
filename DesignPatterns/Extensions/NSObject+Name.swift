//
//  NSObject+Name.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/12/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
    
    var nameOfClass: String {
        return String(describing: type(of: self))
    }
}
