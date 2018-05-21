//
//  SingletonViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 1/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class SingletonViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var textField: UITextField!
 
    // MARK: - Actions
    
    @IBAction private func loginButtonDidPress(_ sender: UIButton) {
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        // MARK: Sets value to singleton
        
        UserManager.sharedInstance.email = textField.text
        
        view.endEditing(true)
        performSegue(withIdentifier: SegueIdentifier.toUser, sender: self)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
