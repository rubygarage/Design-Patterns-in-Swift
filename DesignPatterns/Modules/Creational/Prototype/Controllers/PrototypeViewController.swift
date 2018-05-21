//
//  PrototypeViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 1/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

private enum ResponseType: Int {
    case success, fail
}

private enum ReactionType: Int {
    case like, love, haha, wow
}

class PrototypeViewController: UIViewController {
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var likeCountLable: UILabel!
    @IBOutlet private weak var loveCountLable: UILabel!
    @IBOutlet private weak var hahaCountLable: UILabel!
    @IBOutlet private weak var wowCountLable: UILabel!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var loveButton: UIButton!
    @IBOutlet private weak var hahaButton: UIButton!
    @IBOutlet private weak var wowButton: UIButton!
    
    private let delay = 0.5
    
    // MARK: Registry of reactions
    
    private let reactionRegistry = ReactionRegistry()
    
    // MARK: Reactions that used in this controller
    
    private var reactions: [Reaction] = []
    
    private var labels: [UILabel] {
        return [likeCountLable, loveCountLable, hahaCountLable, wowCountLable]
    }
    private var buttons: [UIButton] {
        return [likeButton, loveButton, hahaButton, wowButton]
    }
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        labels.forEach {
            if let reaction = reactionRegistry.get(by: $0.tag) {
                $0.text = String(reaction.count)
            }
        }
        
        buttons.forEach {
            guard let reaction = reactionRegistry.get(by: $0.tag) else {
                return
            }
            
            if let reaction = reaction as? EmojiReaction, let image = UIImage(named: reaction.nameOfEmoji) {
                $0.setImage(image, for: .normal)
            } else if let reaction = reaction as? PhraseReaction {
                $0.setTitle(reaction.phrase, for: .normal)
            }
            
            // MARK: Appends reactions from registry
            
            reactions.append(reaction)
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func reactionButtonDidPress(_ sender: UIButton) {
        var reactionLabel: UILabel!
        
        switch sender.tag {
        case ReactionType.like.rawValue:
            reactionLabel = likeCountLable
        case ReactionType.love.rawValue:
            reactionLabel = loveCountLable
        case ReactionType.haha.rawValue:
            reactionLabel = hahaCountLable
        case ReactionType.wow.rawValue:
            reactionLabel = wowCountLable
        default:
            break
        }
        
        let index = reactionLabel.tag
        let originalReaction = reactions[index]
        
        // MARK: Makes clone and changes it
        
        let cloneOfReaction = originalReaction.clone()
        cloneOfReaction.count += 1
        reactionLabel.text = String(cloneOfReaction.count)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            guard let strongSelf = self else {
                return
            }
            
            if strongSelf.segmentedControl.selectedSegmentIndex == ResponseType.success.rawValue {
                
                // MARK: Replaces original reaction with clone
                
                strongSelf.reactions[index] = cloneOfReaction
            } else {
                
                // MARK: Uses original reaction
                
                reactionLabel.text = String(originalReaction.count)
            }
        }
    }
}
