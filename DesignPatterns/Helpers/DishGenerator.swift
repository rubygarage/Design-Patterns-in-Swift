//
//  DishGenerator.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 2/19/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import Foundation

enum DishCategory: Int {
    case sets, firstCourses, mainCourses, garnishes, drinks
    
    static let allValues = [sets, firstCourses, mainCourses, garnishes, drinks]
}

struct DishGenerator {    
    static var bouillou: Dish {
        return Dish(name: "Dish.Bouillou".localized(), price: 1.00)
    }
    
    static var chips: Dish {
        return Dish(name: "Dish.Chips".localized(), price: 1.20)
    }
    
    static var coffee: Dish {
        return Dish(name: "Dish.Coffee".localized(), price: 0.80)
    }
    
    static var eggs: Dish {
        return Dish(name: "Dish.Eggs".localized(), price: 1.50)
    }
    
    static var pasta: Dish {
        return Dish(name: "Dish.Pasta".localized(), price: 1.80)
    }
    
    static var soup: Dish {
        return Dish(name: "Dish.Soup".localized(), price: 1.50)
    }
    
    static var steak: Dish {
        return Dish(name: "Dish.Steak".localized(), price: 2.30)
    }
    
    static var tea: Dish {
        return Dish(name: "Dish.Tea".localized(), price: 0.50)
    }
    
    static func name(OfCategory category: DishCategory) -> String {
        switch category {
        case .firstCourses:
            return "First courses".localized()
        case .mainCourses:
            return "Main courses".localized()
        case .garnishes:
            return "Garnishes".localized()
        case .drinks:
            return "Drinks".localized()
        default:
            return "Sets".localized()
        }
    }
    
    static func dishes(OfCategory category: DishCategory) -> [Dish] {
        switch category {
        case .firstCourses:
            return [DishGenerator.bouillou, DishGenerator.soup]
        case .mainCourses:
            return [DishGenerator.eggs, DishGenerator.steak]
        case .garnishes:
            return [DishGenerator.chips, DishGenerator.pasta]
        case .drinks:
            return [DishGenerator.coffee, DishGenerator.tea]
        default:
            let breakfastPrice = DishGenerator.eggs.price + DishGenerator.chips.price + DishGenerator.coffee.price
            let lanchPrice = DishGenerator.soup.price + DishGenerator.steak.price + DishGenerator.tea.price
            
            return [Dish(name: "Breakfast".localized(), price: breakfastPrice), Dish(name: "Lanch".localized(), price: lanchPrice)]
        }
    }
}
