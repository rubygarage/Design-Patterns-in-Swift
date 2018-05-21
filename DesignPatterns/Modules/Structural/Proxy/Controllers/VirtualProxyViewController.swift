//
//  VirtualProxyViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit
import Photos

class VirtualProxyViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: Proxy that used in controller
    
    private let photoServiceProxy = PhotoServiceProxy()
    
    // MARK: - View controller lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getRandomImage()
    }
    
    // MARK: - Setup
    
    private func getRandomImage() {
        
        // MARK: Inits and uses real service when it necessary
        
        photoServiceProxy.getRandomImage { [weak self] image in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.imageView.image = image
        }
    }
    
    // MARK: - Actions

    @IBAction private func buttonDidPress(_ sender: UIButton) {
        getRandomImage()
    }
}
