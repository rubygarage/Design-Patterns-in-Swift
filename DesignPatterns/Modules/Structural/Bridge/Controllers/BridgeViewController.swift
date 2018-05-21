//
//  BridgeViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class BridgeViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var button: UIButton!
    
    // MARK: Animators that contains views
    
    private lazy var shakeAnimator: ShakeAnimator = {
        return ShakeAnimator(view: textField)
    }()
    private lazy var pulseAnimator: PulseAnimator = {
        return PulseAnimator(view: button)
    }()
    
    // MARK: - Actions
    
    @IBAction private func loginButtonDidPress(_ sender: UIButton) {
        view.endEditing(true)
        
        // MARK: Shake animator that works with text field
        
        shakeAnimator.animateView()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // MARK: Pulse animator that works with button
        
        pulseAnimator.animateView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
