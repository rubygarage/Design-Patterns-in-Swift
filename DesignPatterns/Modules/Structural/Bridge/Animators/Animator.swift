//
//  Animator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/13/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

// MARK: Abstraction that contain implementation to work with it

class Animator {
    
    // MARK: Implementation (or interface)
    
    var view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    func animateView() {}
}
