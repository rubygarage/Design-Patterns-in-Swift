//
//  Route.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct Route {
    var locations: [Location]
    
    // MARK: Creates iterator with collection
    
    func makeIterator() -> Iterator {
        return LocationIterator(locations: locations)
    }
}
