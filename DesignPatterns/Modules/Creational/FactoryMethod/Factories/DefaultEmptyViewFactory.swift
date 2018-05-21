//
//  DefaultEmptyViewFactory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class DefaultEmptyViewFactory: EmptyViewFactory {
    override var emptyView: EmptyView {
        return DefaultEmptyView()
    }
    override var title: String {
        return "Label.NoItems".localized()
    }
}
