//
//  ThemeFactory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

protocol ThemeFactory: class {
    func createSwitch() -> UISwitch
    func createSlider() -> UISlider
}
