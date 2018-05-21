//
//  LocalEvent+Details.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

extension Event {
    var description: String {
        return "Label.EventDescription".localizedFormat(title, startDate, endDate)
    }
}
