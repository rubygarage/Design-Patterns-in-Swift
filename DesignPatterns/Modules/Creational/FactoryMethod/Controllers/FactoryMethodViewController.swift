//
//  FactoryMethodViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 1/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

private enum EmptyViewType: Int {
    case `default`
    case clickable
}

class FactoryMethodViewController: UIViewController, EmptyViewDelegate {
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    // MARK: Factory that used in controller
    
    private var emptyViewCreator: EmptyViewFactory!
    
    // MARK: - Controller view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEmptyView()
    }
    
    // MARK: - Setup
    
    private func setupEmptyView() {
        removeEmptyViewIfNeeded()
        
        // MARK: Creates concrete factory and uses it
        
        emptyViewCreator = segmentedControl.selectedSegmentIndex == EmptyViewType.default.rawValue ? DefaultEmptyViewFactory() : ClickableEmptyViewFactory()
        emptyViewCreator.insertEmptyView(to: view, at: 0, delegate: self)
    }
    
    private func removeEmptyViewIfNeeded() {
        view.subviews.forEach {
            if $0 is EmptyView {
                $0.removeFromSuperview()
            }
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func segmentedControlValueDidChange(_ sender: UISegmentedControl) {
        setupEmptyView()
    }

    // MARK: - EmptyViewDelegate

    func viewDidPerformCustomAction(_ epmtyView: EmptyView) {
        let alertController = UIAlertController(title: "Label.TryLater".localized(), message: nil, preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: NameOfColor.main)
        
        let action = UIAlertAction(title: "Button.OK".localized(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
}
