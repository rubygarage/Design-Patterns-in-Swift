//
//  EmojiReaction.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class EmojiReaction: Reaction {
    var nameOfEmoji: String
    
    init(id: Int, count: Int = 0, nameOfEmoji: String) {
        self.nameOfEmoji = nameOfEmoji
        
        super.init(id: id, count: count)
    }
    
    init(reaction: EmojiReaction) {
        self.nameOfEmoji = reaction.nameOfEmoji
        
        super.init(reaction: reaction)
    }
    
    override func clone() -> Reaction {
        
        // MARK: Clones emoji reaction object
        
        return EmojiReaction(reaction: self)
    }
}
