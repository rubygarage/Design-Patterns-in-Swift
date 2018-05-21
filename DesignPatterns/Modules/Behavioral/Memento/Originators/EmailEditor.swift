//
//  EmailEditor.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/9/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

typealias Email = (to: String?, subject: String?, body: String?)

struct EmailEditor {
    
    // MARK: Private state of originator
    
    private var to: String?
    private var subject: String?
    private var body: String?
    
    mutating func setTo(_ to: String?) {
        self.to = to
    }
    
    mutating func setSubject(_ subject: String?) {
        self.subject = subject
    }
    
    mutating func setBody(_ body: String?) {
        self.body = body
    }
    
    // MARK: Creates snapshot of state
    
    func save() -> EmailSnapshot {
        return EmailSnapshot(to: to, subject: subject, body: body)
    }
    
    // MARK: Restores snapshot of state
    
    func restore(from snapshot: EmailSnapshot) -> Email {
        return (snapshot.to, snapshot.subject, snapshot.body)
    }
}
