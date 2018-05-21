//
//  String+Localization.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/12/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

extension String {    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedFormat(_ arguments: CVarArg...) -> String {
        return String(format: localized(), arguments: arguments)
    }
}
