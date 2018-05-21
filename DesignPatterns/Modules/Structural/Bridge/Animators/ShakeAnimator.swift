//
//  ShakeAnimator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/13/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

// MARK: Abstraction that contain implementation to work with it

class ShakeAnimator: Animator {
    private let deltaOfPoint: CGFloat = 2.5
    private let keyPath = "position"
    private let duration = 0.15
    private let repeatCount: Float = 2
    private let key = "shake"
    
    override func animateView() {
        let fromPoint = CGPoint(x: view.center.x - deltaOfPoint, y: view.center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: view.center.x + deltaOfPoint, y: view.center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        let shakeAnimation = CABasicAnimation(keyPath: keyPath)
        shakeAnimation.duration = duration
        shakeAnimation.repeatCount = repeatCount
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = fromValue
        shakeAnimation.toValue = toValue
        
        // MARK: Works with implementation
        
        view.layer.add(shakeAnimation, forKey: key)
    }
}
