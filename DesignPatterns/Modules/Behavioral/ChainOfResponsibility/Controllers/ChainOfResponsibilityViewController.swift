//
//  ChainOfResponsibilityViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class ChainOfResponsibilityViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    
    // MARK: Middlewares that used in controller
    
    private var emailMiddleware: Middleware!
    private var personMiddleware: Middleware!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMiddlewares()
    }

    // MARK: - Setup
    
    private func setupMiddlewares() {
        
        // MARK: Creates and links few middlewares
        
        emailMiddleware = EmptyStringValidatorMiddleware()
            .linkWith(EmailValidatorMiddleware())
        
        // Creates sigle middleware
        
        personMiddleware = PersonValidatorMiddleware()
    }
    
    private func show(_ message: String) {
        let alertController = UIAlertController(title: "Label.Message".localized(), message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: NameOfColor.main)
        
        let action = UIAlertAction(title: "Button.OK".localized(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction private func buttonDidPress(_ sender: UIButton) {
        guard let email = emailTextField.text, let firstName = firstNameTextField.text, let lastName = lastNameTextField.text else {
            return
        }
        
        view.endEditing(true)
        
        // MARK: Uses middlewares
        
        let person = Person(firstName: firstName, lastName: lastName)
        let isValidEmail = emailMiddleware.check(value: email)
        let isValidPerson = personMiddleware.check(value: person)
        var message: String!
        
        switch (isValidEmail, isValidPerson) {
        case (false, false):
            message = "Label.NotValidEmailAndPerson".localized()
        case (false, true):
            message = "Label.NotValidEmail".localized()
        case (true, false):
            message = "Label.NotValidPerson".localized()
        default:
            message = "Label.ValidEmailAndPerson".localized()
        }
        
        show(message)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
