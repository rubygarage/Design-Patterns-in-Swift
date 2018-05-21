//
//  LocationIterator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import CoreLocation

class LocationIterator: Iterator {
    private var locations: [Location]
    private var position = 0
    
    init(locations: [Location]) {
        self.locations = locations
    }
    
    // MARK: Returns next adapted data from collection
    
    func next() -> Any? {
        guard position < locations.count else {
            return nil
        }
        
        let location = locations[position]
        position += 1
        
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}
