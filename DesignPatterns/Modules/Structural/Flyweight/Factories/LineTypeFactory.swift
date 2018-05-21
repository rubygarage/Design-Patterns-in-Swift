//
//  LineTypeFactory.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 4/3/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

struct LineTypeFactory {
    static private var lineTypes: [String: LineType] = [:]
    
    static func lineType(withName name: String, width: CGFloat, color: UIColor) -> LineType {
        var lineType = lineTypes[name]
        
        if lineType == nil {
            lineType = LineType(name: name, width: width, color: color)
            lineTypes[name] = lineType
        }
        
        return lineType!
    }
}
