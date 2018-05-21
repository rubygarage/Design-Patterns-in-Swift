//
//  Event.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol Event: class {
    var title: String { get }
    var startDate: String { get }
    var endDate: String { get }
}
