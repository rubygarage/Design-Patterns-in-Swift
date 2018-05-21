//
//  AudioSessionService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import AVFoundation

protocol AudioSessionServiceDelegate: class {
    func audioSessionService(_ audioSessionService: AudioSessionService, recordPermissionDidAllow allowed: Bool)
}

class AudioSessionService {
    weak var delegate: AudioSessionServiceDelegate?
    
    func setupSession() {
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord, with: [.defaultToSpeaker])
        try! AVAudioSession.sharedInstance().setActive(true)
        
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] allowed in
            DispatchQueue.main.async {
                guard let strongSelf = self, let delegate = strongSelf.delegate else {
                    return
                }
                
                delegate.audioSessionService(strongSelf, recordPermissionDidAllow: allowed)
            }
        }
    }
    
    func deactivateSession() {
        try! AVAudioSession.sharedInstance().setActive(false)
    }
}
