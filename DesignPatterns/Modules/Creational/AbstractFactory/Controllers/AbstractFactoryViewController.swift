//
//  AbstractFactoryViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 1/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

private enum ThemeType: Int {
    case light
    case dark
}

class AbstractFactoryViewController: UIViewController {
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var stackView: UIStackView!
    
    // MARK: Factory that used in controller
    
    private var themeCreator: ThemeFactory!

    // MARK: - Controller view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackView()
    }
    
    // MARK: - Setup
    
    private func setupStackView() {
        removeStackViewArrangedSubviewsIfNeeded()
        
        // MARK: Creates concrete factory and uses it
        
        themeCreator = segmentedControl.selectedSegmentIndex == ThemeType.light.rawValue ? LightThemeFactory() : DarkThemeFactory()
        
        stackView.superview?.backgroundColor = segmentedControl.selectedSegmentIndex == ThemeType.light.rawValue ? UIColor.white : UIColor(named: NameOfColor.main)
        stackView.addArrangedSubview(themeCreator.createSlider())
        stackView.addArrangedSubview(themeCreator.createSwitch())
    }
    
    private func removeStackViewArrangedSubviewsIfNeeded() {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func segmentedControlValueDidChange(_ sender: UISegmentedControl) {
        setupStackView()
    }
}
