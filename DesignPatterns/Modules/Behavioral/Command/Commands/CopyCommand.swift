//
//  CopyCommand.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class CopyCommand: StringCommand {
    override func execute() -> Bool {
        if textField?.text != nil, let selectedTextRange = textField?.selectedTextRange {
            StringCommand.buffer = textField?.text(in: selectedTextRange)
        }
        
        return false
    }
}
