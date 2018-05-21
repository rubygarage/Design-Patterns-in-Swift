//
//  LightThemeFactory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class LightThemeFactory: ThemeFactory {
    
    // MARK: - ThemeFactory
    
    func createSwitch() -> UISwitch {
        return LightSwitch()
    }
    
    func createSlider() -> UISlider {
        return LightSlider()
    }
}
