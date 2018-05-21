//
//  PasteCommand.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class PasteCommand: StringCommand {
    override func execute() -> Bool {
        guard let buffer = StringCommand.buffer, !buffer.isEmpty else {
            return false
        }
        
        guard let textField = textField, let selectedTextRange = textField.selectedTextRange else {
            return false
        }
        
        let start = textField.beginningOfDocument
        let end = textField.endOfDocument
        let selectedStart = selectedTextRange.start
        let selectedEnd = selectedTextRange.end
        
        guard let firstRange = textField.textRange(from: start, to: selectedStart), let lastRange = textField.textRange(from: selectedEnd, to: end) else {
            return false
        }

        guard let firstText = textField.text(in: firstRange), let lastText = textField.text(in: lastRange) else {
            return false
        }
        
        makeBackup()
        textField.text = firstText + buffer + lastText
        
        return true
    }
}
