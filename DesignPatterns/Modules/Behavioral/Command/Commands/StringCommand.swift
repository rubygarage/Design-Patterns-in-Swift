//
//  StringCommand.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

// MARK: Base command class

class StringCommand {
    static var buffer: String?
    
    var textField: UITextField?
    var backup: String?
    
    func execute() -> Bool {
        return false
    }
    
    func makeBackup() {
        backup = textField?.text
    }
    
    func undo() {
        textField?.text = backup
    }
}
