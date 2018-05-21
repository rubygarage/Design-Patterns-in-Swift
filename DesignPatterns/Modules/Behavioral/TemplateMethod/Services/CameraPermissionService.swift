//
//  LocationPermissionService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/10/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import AVFoundation

class CameraPermissionService: PermissionService {
    override func checkStatus() -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .video).rawValue
        
        return status == AVAuthorizationStatus.authorized.rawValue
    }
    
    override func requestAuthorization(_ completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video) { status in
            completion(status)
        }
    }
}
