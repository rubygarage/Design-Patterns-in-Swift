//
//  TemplateMethodViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

private enum PermissionType: Int {
    case photo
    case camera
}

class TemplateMethodViewController: UIViewController {
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    // MARK: Subclass of template method that used in controller
    
    private var permissionService: PermissionService!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    // MARK: - Setup

    private func setupData() {
        
        // MARK: Sets up subclass of template method
        
        permissionService = segmentedControl.selectedSegmentIndex == PermissionType.photo.rawValue ? PhotoPermissionService() : CameraPermissionService()
    }
    
    private func show(_ message: String) {
        let alertController = UIAlertController(title: "Label.Message".localized(), message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: NameOfColor.main)
        
        let action = UIAlertAction(title: "Button.OK".localized(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction private func segmentedControlValueDidChange(_ sender: UISegmentedControl) {
        setupData()
    }
    
    @IBAction private func buttonDidPress(_ sender: UIButton) {
        
        // MARK: Usage of template method's subclass
        
        permissionService.authorize { [weak self] (_, message) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.show(message)
        }
    }
}
