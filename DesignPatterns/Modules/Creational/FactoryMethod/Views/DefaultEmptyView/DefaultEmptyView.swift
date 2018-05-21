//
//  DefaultEmptyView.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class DefaultEmptyView: EmptyView {
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Setup
    
    override func setupViews() {
        imageView.image = #imageLiteral(resourceName: "Placeholder")
    }
}
