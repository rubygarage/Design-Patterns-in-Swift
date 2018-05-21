//
//  ProtectionProxyViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class ProtectionProxyViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var wirelessNameTextField: UITextField!
    @IBOutlet private weak var wirelessPasswordTextField: UITextField!
    @IBOutlet private weak var saveButton: UIButton!
    
    // MARK: Proxy that used in controller
    
    private var routerServiceProxy: RouterServiceProxy!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupRouterService()
    }
    
    // MARK: - Setup
    
    private func setupRouterService() {
        
        // MARK: Inits proxy with real service object
        
        let routerService = RouterService()
        routerServiceProxy = RouterServiceProxy(routerService: routerService)
    }
    
    private func switchEnablingOfControls() {
        usernameTextField.isEnabled = !usernameTextField.isEnabled
        passwordTextField.isEnabled = !passwordTextField.isEnabled
        loginButton.isEnabled = !loginButton.isEnabled
        
        wirelessNameTextField.isEnabled = !wirelessNameTextField.isEnabled
        wirelessPasswordTextField.isEnabled = !wirelessPasswordTextField.isEnabled
        saveButton.isEnabled = !saveButton.isEnabled
    }
    
    private func clerWirelessTextFields() {
        wirelessNameTextField.text = nil
        wirelessPasswordTextField.text = nil
    }
    
    private func showError() {
        let alertController = UIAlertController(title: "Label.Error".localized(), message: "Label.NoAccess".localized(), preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: NameOfColor.main)
        
        let action = UIAlertAction(title: "Button.OK".localized(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Actions

    @IBAction private func loginButtonDidPress(_ sender: UIButton) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {
            return
        }
        
        view.endEditing(true)
        
        // MARK: Gets access to real service by proxy
        
        let success = routerServiceProxy.login(with: username, password: password)
        
        guard success else {
            showError()
            
            return
        }
        
        switchEnablingOfControls()
        
        // MARK: Gets data from real service by proxy
        
        wirelessNameTextField.text = routerServiceProxy.name
        wirelessPasswordTextField.text = routerServiceProxy.password
    }
    
    @IBAction private func saveButtonDidPress(_ sender: UIButton) {
        guard let wirelessName = wirelessNameTextField.text, let wirelessPassword = wirelessPasswordTextField.text else {
            return
        }
        
        view.endEditing(true)
        switchEnablingOfControls()
        
        // MARK: Sets data to real service by proxy
        
        routerServiceProxy.change(name: wirelessName, password: wirelessPassword)
        routerServiceProxy.logout()
        
        clerWirelessTextFields()
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
