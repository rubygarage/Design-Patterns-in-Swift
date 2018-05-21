//
//  ObserverViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class ObserverViewController: UIViewController {
    @IBOutlet private weak var textEditorView: TextEditorView!
    @IBOutlet private weak var stringStatisticsView: StringStatisticsView!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupObservation()
    }

    // MARK: - Setup
    
    private func setupObservation() {
        
        // MARK: Uses observation
        
        textEditorView.addObserver(stringStatisticsView)
    }
}
