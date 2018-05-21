//
//  FileService.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct FileService {
    private var documentDirectory: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    var contentsOfDocumentDirectory: [URL] {
        return try! FileManager.default.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
    }
    
    func path(withPathComponent component: String) -> URL {
        return documentDirectory.appendingPathComponent(component)
    }
    
    func removeItem(at index: Int) {
        let url = contentsOfDocumentDirectory[index]
        
        try! FileManager.default.removeItem(at: url)
    }
}
