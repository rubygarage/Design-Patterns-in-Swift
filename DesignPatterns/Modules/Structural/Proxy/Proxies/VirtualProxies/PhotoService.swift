//
//  PhotoService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Photos
import UIKit

class PhotoService: PhotoProvider {
    private let imageSize = CGSize(width: 500, height: 500)
    
    private var assets: [PHAsset] = []
    
    init() {
        requestAuthorization { [weak self] result in
            guard let strongSelf = self, result.rawValue == PHAuthorizationStatus.authorized.rawValue else {
                return
            }
            
            strongSelf.fetchAssets()
        }
    }
    
    func getRandomImage(_ completion: @escaping (UIImage?) -> Void) {
        guard !assets.isEmpty else {
            return completion(nil)
        }
        
        let index = RandomNumberGenerator.int(0..<assets.count)
        let asset = assets[index]
        let imageManager = PHImageManager.default()
        
        imageManager.requestImage(for: asset, targetSize: imageSize, contentMode: .aspectFill, options: nil) { (result, _) in
            return completion(result)
        }
    }
    
    private func requestAuthorization(_ completion: @escaping (PHAuthorizationStatus) -> Void) {
        PHPhotoLibrary.requestAuthorization(completion)
    }
    
    private func fetchAssets() {
        let assets = PHAsset.fetchAssets(with: .image, options: nil)
        
        assets.enumerateObjects { [weak self] (object, _, _) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.assets.append(object)
        }
    }
}
