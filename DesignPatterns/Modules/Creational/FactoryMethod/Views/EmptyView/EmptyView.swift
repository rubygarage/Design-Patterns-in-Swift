//
//  EmptyView.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/6/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

protocol EmptyViewDelegate: class {
    func viewDidPerformCustomAction(_ epmtyView: EmptyView)
}

class EmptyView: UIView {
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    weak var delegate: EmptyViewDelegate?
    
    // MARK: - View lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    // MARK: - Setup
    
    func setupViews() {}
    
    private func commonInit() {
        loadFromNib()
        setupViews()
    }
}
