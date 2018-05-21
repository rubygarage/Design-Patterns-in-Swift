//
//  StringStatisticsView.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/1/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class StringStatisticsView: UIView, Observer {
    @IBOutlet private weak var numberOfCharactersLabel: UILabel!
    @IBOutlet private weak var numberOfWordsLabel: UILabel!
    
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
    
    private func commonInit() {
        loadFromNib()
    }
    
    // MARK: - Observer
    
    func updateValue(_ value: Any) {
        guard let string = value as? String else {
            return
        }
        
        let components = string.components(separatedBy: .whitespacesAndNewlines)
        let words = components.filter { !$0.isEmpty }
        
        numberOfCharactersLabel.text = String(string.count)
        numberOfWordsLabel.text = String(words.count)
    }
}
