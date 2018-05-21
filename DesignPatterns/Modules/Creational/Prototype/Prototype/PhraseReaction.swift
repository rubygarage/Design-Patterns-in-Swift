//
//  PhraseReaction.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class PhraseReaction: Reaction {
    var phrase: String
    
    init(id: Int, count: Int = 0, phrase: String) {
        self.phrase = phrase
        
        super.init(id: id, count: count)
    }
    
    init(reaction: PhraseReaction) {
        self.phrase = reaction.phrase
        
        super.init(reaction: reaction)
    }
    
    override func clone() -> Reaction {
        
        // MARK: Clones phrase reaction object
        
        return PhraseReaction(reaction: self)
    }
}
