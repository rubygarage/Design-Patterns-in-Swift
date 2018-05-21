//
//  Conditioner.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Conditioner: MementoComponent {
    private var mediator: Mediator?
    
    private(set) var isOn = false {
        didSet {
            
            // MARK: Notifies mediator about changes of power state
            
            mediator?.notify(self)
        }
    }
    
    func powerOn() {
        let state = true
        
        if isOn != state {
            isOn = state
        }
    }
    
    func powerOff() {
        let state = false
        
        if isOn != state {
            isOn = state
        }
    }
    
    // MARK: - Component
    
    func setMediator(_ mediator: Mediator) {
        self.mediator = mediator
    }
}
