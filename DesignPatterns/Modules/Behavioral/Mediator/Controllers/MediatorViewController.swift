//
//  MediatorViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class MediatorViewController: UIViewController {
    @IBOutlet private weak var temperaturView: TemperatureView!
    
    // MARK: Mediator that used in controller
    
    private let temperatureController = TemperatureController()
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTemperatureController()
    }

    // MARK: - Setup
    
    private func setupTemperatureController() {
        
        // MARK: Creates components and setups mediator
        
        let conditioner = Conditioner()
        let thermometer = Thermometer()
        
        temperatureController.registerComponent(conditioner)
        temperatureController.registerComponent(thermometer)
        temperatureController.registerComponent(temperaturView)
        temperatureController.beginControl()
    }
}
