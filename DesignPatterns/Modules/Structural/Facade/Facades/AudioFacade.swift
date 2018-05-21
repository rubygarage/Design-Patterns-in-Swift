//
//  AudioFacade.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol AudioFacadeDelegate: class {
    func audioFacadePlayingDidFinish(_ audioFacade: AudioFacade)
}

// MARK: Facade that hides implementation of different service to record and play audios

class AudioFacade: PlayerServiceDelegate {
    private let audioSessionService = AudioSessionService()
    private let fileService = FileService()
    private let fileFormat = ".m4a"
    
    private var playerService: PlayerService!
    private var recorderService: RecorderService!
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HH:mm:ss"
        
        return dateFormatter
    }()
    
    weak var delegate: AudioFacadeDelegate?
    
    init() {
        audioSessionService.setupSession()
    }
    
    deinit {
        audioSessionService.deactivateSession()
    }
    
    func startRecord() {
        let fileName = dateFormatter.string(from: Date()).appending(fileFormat)
        let url = fileService.path(withPathComponent: fileName)
        
        recorderService = RecorderService(url: url)
        recorderService.startRecord()
    }
    
    func stopRecord() {
        recorderService.stopRecord()
    }
    
    func numberOfRecords() -> Int {
        return fileService.contentsOfDocumentDirectory.count
    }
    
    func nameOfRecord(at index: Int) -> String {
        let url = fileService.contentsOfDocumentDirectory[index]
        
        return url.lastPathComponent
    }
    
    func removeRecord(at index: Int) {
        fileService.removeItem(at: index)
    }
    
    func playRecord(at index: Int) {
        let url = fileService.contentsOfDocumentDirectory[index]
        
        playerService = PlayerService(url: url)
        playerService.delegate = self
        playerService.startPlay()
    }
    
    func stopPlayRecord() {
        playerService.stopPlay()
    }
    
    // MARK: - PlayerServiceDelegate
    
    func playerService(_ playerService: PlayerService, playingDidFinish success: Bool) {
        if success {
            delegate?.audioFacadePlayingDidFinish(self)
        }
    }
}
