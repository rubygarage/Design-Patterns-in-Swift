//
//  Observer.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/1/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol Observer: class {
    func updateValue(_ value: Any)
}
