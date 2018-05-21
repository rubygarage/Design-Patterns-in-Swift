//
//  VisitorViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class VisitorViewController: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var discountLabel: UILabel!
    @IBOutlet private weak var totalPriceLabel: UILabel!
    
    private let currencySymbol = "$"
    
    private var items: [VisitorComponent] = GadgetGenerator.gadgets
    
    // MARK: Visitor that used in controller
    
    private var discountService = DiscountService(smartphoneDiscount: 50.0, smartphoneLowerYear: 2015, smartwatchDiscount: 15.0, smartwatchLowerGeneration: 2)

    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.currencySymbol = currencySymbol
        
        return formatter
    }
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateDiscount()
        setupViews()
    }
    
    // MARK: - Setup
    
    private func calculateDiscount() {
        
        // MARK: Works with visitor
        
        items.forEach {
            $0.accept(discountService)
        }
    }
    
    private func setupViews() {
        let order = items.map({ (gadget: VisitorComponent) -> String in
            if let item = gadget as? Smartphone {
                let price = format(item.price)
                
                return "\(item.brand) \(item.model) \(item.year) \(price)"
            } else if let item = gadget as? Smartwatch {
                let price = format(item.price)
                
                return "\(item.brand) \(item.generation) \(item.year) \(price)"
            }
            
            return ""
        }).joined(separator: "\n")
        
        textView.text = order
        
        let price = items.reduce(0.0, {
            if let item = $1 as? Smartphone {
                return $0 + item.price
            } else if let item = $1 as? Smartwatch {
                return $0 + item.price
            }
            
            return $0
        })
        
        priceLabel.text = format(price)
        discountLabel.text = format(discountService.discount)
        totalPriceLabel.text = format(price - discountService.discount)
    }
    
    private func format(_ price: Double) -> String {
        let priceDecimal = NSDecimalNumber(value: price)
        return formatter.string(from: priceDecimal)!
    }
}
