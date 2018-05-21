//
//  LocationServiceProxy.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import CoreLocation

class LocationServiceProxy: LocationTracker {
    
    // MARK: Real service
    
    private var locationService: LocationService
    private var logs: [String] = []
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HH:mm:ss"
        
        return dateFormatter
    }()
    
    var locationDidUpdate: ((CLLocation) -> Void)?
    var logsDidAppend: ((String) -> Void)?
    
    init(locationService: LocationService) {
        self.locationService = locationService
        
        setupLocationService()
    }
    
    private func setupLocationService() {
        locationService.locationDidUpdate = { [weak self] location in
            guard let strongSelf = self else {
                return
            }
            
            // MARK: Adds log
            
            strongSelf.addLog(with: location)
            
            if let locationDidUpdate = strongSelf.locationDidUpdate {
                locationDidUpdate(location)
            }
        }
    }
    
    private func addLog(with location: CLLocation) {
        let now = Date()
        let dateString = dateFormatter.string(from: now)
        let log = "Label.LocationLog".localizedFormat(dateString, String(location.coordinate.latitude), String(location.coordinate.longitude))
        logs.append(log)
        
        if let logsDidAppend = logsDidAppend {
            logsDidAppend(log)
        }
    }
}
