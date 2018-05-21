//
//  DataSource.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol DataSource: class {
    func writeData(_ data: Any)
    func readData() -> Any
}
