//
//  UserViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Setup views
    
    private func setupViews() {
        
        // MARK: Gets value from singleton
        
        label.text = UserManager.sharedInstance.email
    }
}
