//
//  FlyweightViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class FlyweightViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    private let numerOfLines = 1000
    private let deltaOfRandomPoint = 100
    
    // MARK: Lines that used in controller
    
    private var lines: [Line] = []
    
    lazy var width: Int = {
        return Int(view.bounds.width) + deltaOfRandomPoint
    }()
    
    lazy var height: Int = {
        return Int(view.bounds.height) + deltaOfRandomPoint
    }()
    
    // MARK: Flyweights that created by factory
    
    lazy var lineTypes: [LineType] = {
        let redLineType = LineTypeFactory.lineType(withName: "red", width: 1.5, color: UIColor.red)
        let blueLineType = LineTypeFactory.lineType(withName: "blue", width: 1.25, color: UIColor.blue)
        let greenLineType = LineTypeFactory.lineType(withName: "green", width: 1.25, color: UIColor.green)
        let yellowLineType = LineTypeFactory.lineType(withName: "yellow", width: 1.0, color: UIColor.yellow)
        
        return [redLineType, blueLineType, greenLineType, yellowLineType]
    }()
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Generates lines
        
        generateLines(with: numerOfLines)
        
        // MARK: Uses lines
        
        drawLines()
    }
    
    // MARK: - Setup
    
    private func generateLines(with numerOfLines: Int) {
        for _ in 0...numerOfLines {
            let startPoint = randomPoint(withEdge: width)
            let endPoint = randomPoint(withEdge: height)
            
            let lineTypeIndex = RandomNumberGenerator.int(0..<lineTypes.count)
            let lineType = lineTypes[lineTypeIndex]
            
            let line = Line(startPoint: startPoint, endPoint: endPoint, lineType: lineType)
            lines.append(line)
        }
    }
    
    private func drawLines() {
        let size = imageView.frame.size
        var image: UIImage?
        
        DispatchQueue.global(qos: .background).async { [unowned self] in
            self.lines.forEach {
                image = $0.draw(on: image, with: size)
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                
                strongSelf.imageView.image = image
            }
        }
    }
    
    private func randomPoint(withEdge edge: Int) -> CGPoint {
        let x = RandomNumberGenerator.int(-deltaOfRandomPoint..<edge)
        let y = RandomNumberGenerator.int(-deltaOfRandomPoint..<edge)
        return CGPoint(x: x, y: y)
    }
}
