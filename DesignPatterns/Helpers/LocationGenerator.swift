//
//  LocationGenerator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/29/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct LocationGenerator {
    static var locations: [Location] {
        return [Location(name: "Menorah", latitude: 48.463607, longitude: 35.052960),
                Location(name: "MOST-City", latitude: 48.466204, longitude: 35.050166),
                Location(name: "Home", latitude: 48.466821, longitude: 35.043414)]
    }
}
