//
//  OrderBuilder.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

protocol OrderBuilder: class {
    func reset()
    func setFirstCourse(_ dish: Dish)
    func setMainCourse(_ dish: Dish)
    func setGarnish(_ dish: Dish)
    func setDrink(_ dish: Dish)
    func getResult() -> Order?
}
