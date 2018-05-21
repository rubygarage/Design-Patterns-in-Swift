//
//  StringCommandHistory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/2/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

// MARK: Command history that implemented like stack

class StringCommandHistory {
    private var history: [StringCommand] = []
    
    func push(_ command: StringCommand) {
        history.append(command)
    }
    
    func pop() -> StringCommand? {
        return history.popLast()
    }
}
