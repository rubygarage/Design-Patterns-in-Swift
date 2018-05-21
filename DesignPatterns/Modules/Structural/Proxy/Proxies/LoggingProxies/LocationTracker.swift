//
//  LocationTracker.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import CoreLocation

protocol LocationTracker: class {
    var locationDidUpdate: ((CLLocation) -> Void)? { get }
}
