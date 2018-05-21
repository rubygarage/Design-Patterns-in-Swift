//
//  DecoratorViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class DecoratorViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var messageTextField: UITextField!
    @IBOutlet private weak var encryptionKeyTextField: UITextField!
    @IBOutlet private weak var writeButton: UIButton!
    @IBOutlet private weak var readButton: UIButton!
    
    private let userDefaultsKey = "decorator"
    
    // MARK: Source that wrapped in few decorators
    
    private var source: DataSource {
        var source: DataSource = UserDefaultsDataSource(userDefaultsKey: userDefaultsKey)
        source = EncodingDecorator(wrappee: source, encoding: .utf8)
        source = EncryptionDecorator(wrappee: source, encryptionKey: encryptionKeyTextField.text!)
        
        return source
    }
    
    // MARK: - Setup
    
    private func switchEnablingOfButtons() {
        writeButton.isEnabled = !writeButton.isEnabled
        readButton.isEnabled = !readButton.isEnabled
    }
    
    private func show(_ message: String) {
        let alertController = UIAlertController(title: "Label.Message".localized(), message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: NameOfColor.main)
        
        let action = UIAlertAction(title: "Button.OK".localized(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction private func writeButtonDidPress(_ sender: UIButton) {
        guard let message = messageTextField.text, !message.isEmpty, let encryptionKey = encryptionKeyTextField.text, !encryptionKey.isEmpty else {
            return
        }
        
        view.endEditing(true)
        switchEnablingOfButtons()
        
        // MARK: Writes string
        
        source.writeData(message)
    }
    
    @IBAction private func readButtonDidPress(_ sender: UIButton) {
        guard let encryptionKey = encryptionKeyTextField.text, !encryptionKey.isEmpty else {
            return
        }
        
        view.endEditing(true)
        switchEnablingOfButtons()
        
        // MARK: Reads string
        
        let message = source.readData() as! String
        show(message)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
