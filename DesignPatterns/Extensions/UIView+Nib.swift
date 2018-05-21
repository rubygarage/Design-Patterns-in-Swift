//
//  UIViewNib.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/12/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

extension UIView {
    func loadFromNib(with nibName: String? = nil) {
        guard let view = Bundle.main.loadNibNamed(nibName ?? nameOfClass, owner: self)?.first as? UIView else {
            return
        }
        
        addViewWithConstraints(view)
    }
}
