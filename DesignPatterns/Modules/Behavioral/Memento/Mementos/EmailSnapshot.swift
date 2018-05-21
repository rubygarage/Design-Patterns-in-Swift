//
//  EmailSnapshot.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct EmailSnapshot {
    private(set) var to: String?
    private(set) var subject: String?
    private(set) var body: String?
}
