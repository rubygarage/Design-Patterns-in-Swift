//
//  EmailSnapshotManager.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class EmailSnapshotManager {
    private var history: [EmailSnapshot] = []
    
    static let sharedInstance = EmailSnapshotManager()
    
    private init() {}
    
    func push(_ snapshot: EmailSnapshot) {
        history.append(snapshot)
    }

    func pop() -> EmailSnapshot? {
        return history.popLast()
    }
}
