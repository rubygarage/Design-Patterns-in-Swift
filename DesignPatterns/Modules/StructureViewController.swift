//
//  StructureViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit
import WebKit

class StructureViewController: UIViewController {
    @IBOutlet private weak var webView: WKWebView!
    
    var url: URL?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
    }
    
    // MARK: - Setup
    
    private func setupWebView() {
        guard let url = url else {
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    // MARK: - Actions
    
    @IBAction func closeButtonDidPress(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
