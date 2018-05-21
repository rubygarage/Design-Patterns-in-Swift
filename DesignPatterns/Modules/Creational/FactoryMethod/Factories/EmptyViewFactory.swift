//
//  EmptyViewFactory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class EmptyViewFactory {
    var emptyView: EmptyView {
        return EmptyView()
    }
    var title: String? {
        return nil
    }
    
    func insertEmptyView(to view: UIView, at index: Int, delegate: EmptyViewDelegate? = nil) {
        let emptyView = self.emptyView
        emptyView.delegate = delegate
        emptyView.titleLabel.text = title
        insert(subview: emptyView, to: view, at: index)
    }
    
    private func insert(subview: UIView, to view: UIView, at index: Int) {
        view.insertViewWithConstraints(subview, at: index)
    }
}
