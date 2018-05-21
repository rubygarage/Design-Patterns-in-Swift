//
//  ClickableEmptyView.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class ClickableEmptyView: EmptyView {
    @IBOutlet private weak var button: UIButton!
    
    // MARK: - Setup
    
    override func setupViews() {
        button.setTitle("Button.Add".localized(), for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func buttonDidPress(_ sender: UIButton) {
        delegate?.viewDidPerformCustomAction(self)
    }
}
