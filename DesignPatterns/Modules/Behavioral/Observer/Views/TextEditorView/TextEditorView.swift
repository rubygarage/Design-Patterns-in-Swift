//
//  TextEditorView.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/1/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class TextEditorView: UIView, UITextViewDelegate, Subject {
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: Subjects that should be notified by publisher
    
    private var observers: [Observer] = []
    private var value: String!
    
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
    
    // MARK: - UITextViewDelegate
    
    func textViewDidChange(_ textView: UITextView) {
        value = textView.text
        notifyObsevers()
    }
    
    // MARK: - Subject
    
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        if let index = observers.index(where: { $0 === observer}) {
            observers.remove(at: index)
        }
    }
    
    func notifyObsevers() {
        observers.forEach {
            $0.updateValue(value)
        }
    }
}
