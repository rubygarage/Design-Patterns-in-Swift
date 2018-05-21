//
//  CompositeViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class CompositeViewController: UIViewController {
    @IBOutlet private weak var electricityPowerTextFiled: UITextField!
    @IBOutlet private weak var electricityRateTextFiled: UITextField!
    @IBOutlet private weak var waterAmountTextFiled: UITextField!
    @IBOutlet private weak var waterRateTextFiled: UITextField!
    @IBOutlet private weak var parkingPriceTextFiled: UITextField!
    
    private let currencySymbol = "$"
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.currencySymbol = currencySymbol
        
        return formatter
    }
    
    // MARK: - Setup
    
    private func showTotalPrice(_ price: Float) {
        let totalPrice = NSDecimalNumber(value: price)
        let message = formatter.string(from: totalPrice)!
        
        let alertController = UIAlertController(title: "Label.TotalPrice".localized(), message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: NameOfColor.main)
        
        let action = UIAlertAction(title: "Button.OK".localized(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction private func totalPriceButtonDidPress(_ sender: UIButton) {
        guard let electricityRate = electricityRateTextFiled.text, !electricityRate.isEmpty, let electricityPower = electricityPowerTextFiled.text, !electricityPower.isEmpty, let waterRate = waterRateTextFiled.text, !waterRate.isEmpty, let waterAmount = waterAmountTextFiled.text, !waterAmount.isEmpty, let parkingPrice = parkingPriceTextFiled.text, !parkingPrice.isEmpty else {
            return
        }
        
        view.endEditing(true)
        
        // MARK: Creates payable objects
        
        let electricity = Electricity(rate: Float(electricityRate)!, power: Float(electricityPower)!)
        let water = Water(rate: Float(waterRate)!, amount: Float(waterAmount)!)
        let rent = Rent(electricity: electricity, water: water)
        let parking = Parking(price: Float(parkingPrice)!)
        
        // MARK: Creates compound with payable objects and gets price
        
        let compoundPayable = CompoundPayable()
        compoundPayable.add(rent)
        compoundPayable.add(parking)
        showTotalPrice(compoundPayable.price)
    }
}
