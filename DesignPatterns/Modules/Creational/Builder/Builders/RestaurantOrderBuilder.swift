//
//  RestaurantOrderBuilder.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

class RestaurantOrderBuilder: OrderBuilder {
    private let tipsCoefficient: Float = 0.1
    
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
        
        // MARK: Creates order item with dish and adds tips if it first or main course
        
        item = OrderItem(dish: dish)
        
        switch dishCategory {
        case .firstCourses:
            order.firstCourses.append(item)
            order.tips += dish.price * tipsCoefficient
        case .mainCourses:
            order.mainCourses.append(item)
            order.tips += dish.price * tipsCoefficient
        case .garnishes:
            order.garnishes.append(item)
        case .drinks:
            order.drinks.append(item)
        default:
            break
        }
    }
}
