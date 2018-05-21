//
//  TemperaturView.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class TemperatureView: UIView, MementoComponent {
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var conditionerStateView: UIView!
    @IBOutlet private weak var informationView: UIView!
    @IBOutlet private weak var configurationView: UIView!
    
    private let defaultMaxComfortTemperature = 23
    
    private var mediator: Mediator?
    private var currentTemperature: Int!
    
    private(set) var maxComfortTemperature: Int! {
        didSet {
            
            // MARK: Notifies mediator about changes of max comfort temperature
            
            mediator?.notify(self)
        }
    }
    
    // MARK: - View lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    // MARK: - Setup
    
    func changeTemperature(_ temperature: Int) {
        currentTemperature = temperature
        setupTemperatureLabel()
    }
    
    func changeConditionerState(_ isOn: Bool) {
        conditionerStateView.backgroundColor = isOn ? .green : .groupTableViewBackground
    }
    
    private func commonInit() {
        loadFromNib()
        maxComfortTemperature = defaultMaxComfortTemperature
    }
    
    private func switchVisibilityOfViews() {
        informationView.isHidden = !informationView.isHidden
        configurationView.isHidden = !configurationView.isHidden
    }
    
    private func setupTemperatureLabel() {
        temperatureLabel.text = informationView.isHidden ? String(maxComfortTemperature) : String(currentTemperature)
    }
    
    // MARK: - Actions
    
    @IBAction private func viewDidTap(_ sender: UITapGestureRecognizer) {
        switchVisibilityOfViews()
        setupTemperatureLabel()
    }
    
    @IBAction private func temperatureStepperValueDidChange(_ sender: UIStepper) {
        maxComfortTemperature = Int(sender.value)
        setupTemperatureLabel()
    }
    
    // MARK: - Component
    
    func setMediator(_ mediator: Mediator) {
        self.mediator = mediator
    }
}
