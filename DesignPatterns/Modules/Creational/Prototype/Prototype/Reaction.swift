//
//  Reaction.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class Reaction {
    var id: Int
    var count: Int
    
    init(id: Int, count: Int = 0) {
        self.id = id
        self.count = count
    }
    
    init(reaction: Reaction) {
        self.id = reaction.id
        self.count = reaction.count
    }
    
    func clone() -> Reaction {
        
        // MARK: Clones reaction object
        
        return Reaction(reaction: self)
    }
}
