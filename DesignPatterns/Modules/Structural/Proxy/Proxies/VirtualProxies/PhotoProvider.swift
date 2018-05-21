//
//  PhotoProvider.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

protocol PhotoProvider: class {
    func getRandomImage(_ completion: @escaping (UIImage?) -> Void)
}
