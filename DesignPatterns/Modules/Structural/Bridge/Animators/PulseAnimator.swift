//
//  PulseAnimator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/13/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

// MARK: Abstraction that contain implementation to work with it

class PulseAnimator: Animator {
    private let keyPath = "transform.scale"
    private let duration = 0.15
    private let repeatCount: Float = 2
    private let fromValue = 1.0
    private let toValue = 1.1
    private let key = "pulse"
    
    override func animateView() {
        let pulseAnimation = CABasicAnimation(keyPath: keyPath)
        pulseAnimation.duration = duration
        pulseAnimation.repeatCount = repeatCount
        pulseAnimation.autoreverses = true
        pulseAnimation.fromValue = fromValue
        pulseAnimation.toValue = toValue
        
        // MARK: Works with implementation
        
        view.layer.add(pulseAnimation, forKey: key)
    }
}
