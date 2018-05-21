//
//  UIView+Subview.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

extension UIView {
    func addViewWithConstraints(_ view: UIView) {
        addSubview(view)
        addConstraints(to: view)
    }
    
    func insertViewWithConstraints(_ view: UIView, at index: Int) {
        insertSubview(view, at: index)
        addConstraints(to: view)
    }
    
    private func addConstraints(to view: UIView) {
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
