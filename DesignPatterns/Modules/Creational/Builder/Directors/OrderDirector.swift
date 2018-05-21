//
//  OrderDirector.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

struct OrderDirector {
    private var builder: OrderBuilder
    
    init(builder: OrderBuilder) {
        self.builder = builder
    }
    
    func makeBreakfast() -> Order {
        
        // MARK: Makes breakfast order by builder
        
        builder.reset()
        
        builder.setMainCourse(DishGenerator.eggs)
        builder.setGarnish(DishGenerator.chips)
        builder.setDrink(DishGenerator.coffee)
        
        return builder.getResult()!
    }
    
    func makeLanch() -> Order {
        
        // MARK: Makes lanch order by builder
        
        builder.reset()
        
        builder.setFirstCourse(DishGenerator.soup)
        builder.setMainCourse(DishGenerator.steak)
        builder.setDrink(DishGenerator.tea)
        
        return builder.getResult()!
    }
}
