//
//  StateViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class StateViewController: UIViewController {
    @IBOutlet private weak var accountTypeLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var withdrawButton: UIButton!
    @IBOutlet private weak var payInterestButton: UIButton!
    
    private let currencySymbol = "$"
    
    // MARK: Context that used in controller
    
    private let account = Account()
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.currencySymbol = currencySymbol
        
        return formatter
    }
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabels()
        setupButtons()
    }
    
    // MARK: - Setup
    
    private func setupLabels() {
        
        // MARK: Works with context
        
        accountTypeLabel.text = account.state.nameOfClass.components(separatedBy: AccountState.nameOfClass).first
        
        let balance = NSDecimalNumber(value: account.balance)
        balanceLabel.text = formatter.string(from: balance)
    }
    
    private func setupButtons() {
        
        // MARK: Works with context
        
        withdrawButton.isEnabled = account.balance > 0.0
        payInterestButton.isEnabled = account.state is GoldAccountState
    }
    
    // MARK: - Actions

    @IBAction private func depositeButtonDidPress(_ sender: UIButton) {
        guard let amountText = amountTextField.text, let amount = Double(amountText) else {
            return
        }
        
        view.endEditing(true)
        
        // MARK: Works with context
        
        account.deposit(amount)
        
        setupLabels()
        setupButtons()
    }
    
    @IBAction private func withdrawButtonDidPress(_ sender: Any) {
        guard let amountText = amountTextField.text, let amount = Double(amountText) else {
            return
        }
        
        view.endEditing(true)
        
        // MARK: Works with context
        
        account.withdraw(amount)
        
        setupLabels()
        setupButtons()
    }
    
    @IBAction private func payInterestButtonDidPress(_ sender: Any) {
        view.endEditing(true)
        
        // MARK: Works with context
        
        account.payInterest()
        
        setupLabels()
        setupButtons()
    }
}
