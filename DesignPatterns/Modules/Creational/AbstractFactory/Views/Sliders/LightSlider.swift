//
//  LightSlider.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class LightSlider: UISlider {

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
    
    private func commonInit() {
        tintColor = UIColor(named: NameOfColor.main)
    }
}
