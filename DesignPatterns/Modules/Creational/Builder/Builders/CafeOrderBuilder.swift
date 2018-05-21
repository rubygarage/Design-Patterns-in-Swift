//
//  CafeOrderBuilder.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/18/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class CafeOrderBuilder: OrderBuilder {
    private var order: Order!
    
    // MARK: - OrderBuilder
    
    func reset() {
        
        // MARK: Resets order
        
        order = Order()
    }
    
    func setFirstCourse(_ dish: Dish) {
        if order != nil {
            set(dish, at: order.firstCourses, withCategory: .firstCourses)
        }
    }
    
    func setMainCourse(_ dish: Dish) {
        if order != nil {
            set(dish, at: order.mainCourses, withCategory: .mainCourses)
        }
    }
    
    func setGarnish(_ dish: Dish) {
        if order != nil {
            set(dish, at: order.garnishes, withCategory: .garnishes)
        }
    }
    
    func setDrink(_ dish: Dish) {
        if order != nil {
            set(dish, at: order.drinks, withCategory: .drinks)
        }
    }
    
    func getResult() -> Order? {
        
        // MARK: Gets builded order
        
        return order ?? nil
    }
    
    private func set(_ dish: Dish, at orderCategory: [OrderItem], withCategory dishCategory: DishCategory) {
        var item: OrderItem! = orderCategory.filter( { $0.dish.name == dish.name } ).first
        
        guard item == nil else {
            
            // MARK: Changes count of order item
            
            item.count += 1
            
            return
        }
        
        // MARK: Creates order item with dish
        
        item = OrderItem(dish: dish)
        
        switch dishCategory {
        case .firstCourses:
            order.firstCourses.append(item)
        case .mainCourses:
            order.mainCourses.append(item)
        case .garnishes:
            order.garnishes.append(item)
        case .drinks:
            order.drinks.append(item)
        default:
            break
        }
    }
}
