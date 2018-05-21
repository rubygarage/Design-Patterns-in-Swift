//
//  TemperatureController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class TemperatureController: Mediator {
    private var conditioner: Conditioner?
    private var thermometer: Thermometer?
    private var temperaturView: TemperatureView?
    private var maxComfortTemperature: Int?
    
    func beginControl() {
        thermometer?.activate()
        maxComfortTemperatureDidChange()
    }
    
    // MARK: - Mediator
    
    func registerComponent(_ component: MementoComponent) {
        component.setMediator(self)
        
        if let conditioner = component as? Conditioner {
            self.conditioner = conditioner
        } else if let thermometer = component as? Thermometer {
            self.thermometer = thermometer
        } else if let temperaturView = component as? TemperatureView {
            self.temperaturView = temperaturView
        }
    }
    
    func notify(_ sender: MementoComponent) {
        if sender is Conditioner {
            conditionerStateDidChange()
        } else if sender is Thermometer {
            temperatureDidChange()
        } else if sender is TemperatureView {
            maxComfortTemperatureDidChange()
        }
    }
    
    private func conditionerStateDidChange() {
        temperaturView?.changeConditionerState(conditioner!.isOn)
    }
    
    private func temperatureDidChange() {
        let temperature = thermometer!.temperature
        temperaturView?.changeTemperature(temperature)
        
        guard let maxComfortTemperature = maxComfortTemperature else {
            return
        }
        
        if temperature > maxComfortTemperature {
            conditioner?.powerOn()
        } else {
            conditioner?.powerOff()
        }
    }
    
    private func maxComfortTemperatureDidChange() {
        maxComfortTemperature = temperaturView?.maxComfortTemperature
    }
}
