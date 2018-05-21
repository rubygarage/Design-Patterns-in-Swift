//
//  PhotoServiceProxy.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class PhotoServiceProxy: PhotoProvider {
    
    // MARK: Real service
    
    private lazy var photoService: PhotoService = {
        return PhotoService()
    }()
    
    // MARK: Gets random image after lazy initialization of real service that has long/havy operations in initializer
    
    func getRandomImage(_ completion: @escaping (UIImage?) -> Void) {
        photoService.getRandomImage { image in
            completion(image)
        }
    }
}
