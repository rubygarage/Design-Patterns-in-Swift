//
//  PlayerService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import AVFoundation

protocol PlayerServiceDelegate: class {
    func playerService(_ playerService: PlayerService, playingDidFinish success: Bool)
}

class PlayerService: NSObject, AVAudioPlayerDelegate {
    private var player: AVAudioPlayer!
    private var url: URL
    
    weak var delegate: PlayerServiceDelegate?
    
    init(url: URL) {
        self.url = url
    }
    
    func startPlay() {
        player = try! AVAudioPlayer(contentsOf: url)
        player.delegate = self
        player.play()
    }
    
    func stopPlay() {
        player.stop()
    }
    
    // MARK: - AVAudioPlayerDelegate
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.playerService(self, playingDidFinish: flag)
    }
}
