//
//  ClickableEmptyViewFactory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class ClickableEmptyViewFactory: EmptyViewFactory {
    override var emptyView: EmptyView {
        return ClickableEmptyView()
    }
    override var title: String {
        return "Label.NoItemsAdd".localized()
    }
}
