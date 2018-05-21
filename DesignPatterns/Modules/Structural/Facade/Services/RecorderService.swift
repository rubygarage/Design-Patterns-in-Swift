//
//  RecorderService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import AVFoundation

struct RecorderService {
    private var isRecording = false
    private var recorder: AVAudioRecorder!
    private var url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    mutating func startRecord() {
        guard !isRecording else {
            return
        }
        
        isRecording = !isRecording
        
        recorder = try! AVAudioRecorder(url: url, settings: [AVFormatIDKey: kAudioFormatMPEG4AAC])
        recorder.record()
    }
    
    mutating func stopRecord() {
        guard isRecording else {
            return
        }
        
        isRecording = !isRecording
        
        recorder.stop()
    }
}
