//
//  DarkThemeFactory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class DarkThemeFactory: ThemeFactory {
    
    // MARK: - ThemeFactory
    
    func createSwitch() -> UISwitch {
        return DarkSwitch()
    }
    
    func createSlider() -> UISlider {
        return DarkSlider()
    }
}
