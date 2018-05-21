//
//  RouterConfigurator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol RouterConfigurator: class {
    var name: String? { get }
    var password: String? { get }
    
    func change(name: String, password: String)
}
