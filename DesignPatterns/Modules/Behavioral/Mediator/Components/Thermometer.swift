//
//  Thermometer.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Thermometer: MementoComponent {
    private let timeInterval = 1.0
    private let minTemperatur = 20
    private let maxTemperatur = 26
    
    private var timer = Timer()
    private var mediator: Mediator?
    
    private(set) var temperature = 0 {
        didSet {
            
            // MARK: Notifies mediator about changes of temperature
            
            mediator?.notify(self)
        }
    }
    
    deinit {
        timer.invalidate()
    }
    
    func activate() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(updateTemperature), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTemperature() {
        temperature = RandomNumberGenerator.int(minTemperatur..<maxTemperatur)
    }
    
    // MARK: - Component
    
    func setMediator(_ mediator: Mediator) {
        self.mediator = mediator
    }
}
