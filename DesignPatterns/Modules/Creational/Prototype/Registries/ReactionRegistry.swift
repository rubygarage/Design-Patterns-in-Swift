//
//  ReactionRegistry.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct ReactionRegistry {
    var items: [Int: Reaction] = [:]
    
    init() {
        
        // MARK: Sets default objects of registry
        
        let like = EmojiReaction(id: 0, nameOfEmoji: NameOfImage.likeReaction)
        let love = EmojiReaction(id: 1, nameOfEmoji: NameOfImage.loveReaction)
        let haha = PhraseReaction(id: 2, phrase: "Label.Haha".localized())
        let wow = PhraseReaction(id: 3, phrase: "Label.Wow".localized())
        
        set(by: like.id, reaction: like)
        set(by: love.id, reaction: love)
        set(by: haha.id, reaction: haha)
        set(by: wow.id, reaction: wow)
    }
    
    mutating func set(by id: Int, reaction: Reaction) {
        items[id] = reaction
    }
    
    func get(by id: Int) -> Reaction? {
        guard let item = items[id] else {
            return nil
        }
        
        return item.clone()
    }
}
