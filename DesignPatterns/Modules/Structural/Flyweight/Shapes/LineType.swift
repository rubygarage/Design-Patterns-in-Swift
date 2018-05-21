//
//  LineType.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/3/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

// MARK: Flyweight (repeating state) is immutable

class LineType {
    private var name: String
    private var width: CGFloat
    private var color: UIColor
    
    init(name: String, width: CGFloat, color: UIColor) {
        self.name = name
        self.width = width
        self.color = color
    }
    
    func draw(on image: UIImage?, with size: CGSize, from start: CGPoint, to end: CGPoint) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        image?.draw(at: CGPoint.zero)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(width)
        context.setStrokeColor(color.cgColor)
        context.move(to: start)
        context.addLine(to: end)
        context.strokePath()
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return result
    }
}
