//
//  LocationService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import CoreLocation

class LocationService: NSObject, LocationTracker, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager!
    
    var locationDidUpdate: ((CLLocation) -> Void)?
    
    override init() {
        super.init()
        
        setupLocationManager()
    }
    
    deinit {
        stopUpdatingLocation()
    }
    
    private func setupLocationManager() {
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let locationDidUpdate = locationDidUpdate, let location = locations.last {
            locationDidUpdate(location)
        }
    }
}
