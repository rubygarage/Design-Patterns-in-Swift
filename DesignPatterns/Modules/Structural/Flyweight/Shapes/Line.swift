//
//  Line.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/3/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

// MARK: Context (unique state) is mutable

class Line {
    private var startPoint: CGPoint
    private var endPoint: CGPoint
    private var lineType: LineType
    
    init(startPoint: CGPoint, endPoint: CGPoint, lineType: LineType) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.lineType = lineType
    }
    
    func draw(on image: UIImage?, with size: CGSize) -> UIImage? {
        return lineType.draw(on: image, with: size, from: startPoint, to: endPoint)
    }
}
