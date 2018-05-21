//
//  Mediator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol Mediator: class {
    func registerComponent(_ component: MementoComponent)
    func notify(_ sender: MementoComponent)
}
