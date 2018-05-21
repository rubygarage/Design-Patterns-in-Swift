//
//  BuilderViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 1/28/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

private enum OrderType: Int {
    case cafe
    case restaurant
}

class BuilderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!
    
    private let cellIdentifier = "dish"
    private let currencySymbol = "$"
    
    // MARK: Order builder that used for creation of custom orders

    private var orderBuilder: OrderBuilder!
    
    // MARK: Order director that used for creation of sets

    private var orderDirector: OrderDirector!
    
    private var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.currencySymbol = currencySymbol
        
        return formatter
    }
    
    // MARK: - Controller view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
    }
    
    // MARK: - Setup
    
    private func setupData() {
        
        // MARK: Creates concrete builder
        
        orderBuilder = segmentedControl.selectedSegmentIndex == OrderType.cafe.rawValue ? CafeOrderBuilder() : RestaurantOrderBuilder()
        orderBuilder.reset()
        
        // MARK: Creates director with concrete builder
        
        orderDirector = OrderDirector(builder: orderBuilder)
    }
    
    private func show(_ order: Order) {
        let price = NSDecimalNumber(value: order.price)
        let tips = NSDecimalNumber(value: order.tips)
        let message = "Label.OrderPrice".localizedFormat(formatter.string(from: price)!, formatter.string(from: tips)!)
        
        let alertController = UIAlertController(title: "Label.Order".localized(), message: message, preferredStyle: .alert)
        alertController.view.tintColor = UIColor(named: NameOfColor.main)
        
        let action = UIAlertAction(title: "Button.OK".localized(), style: .default)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Actions
    
    @IBAction private func segmentedControlValueDidChange(_ sender: UISegmentedControl) {
        setupData()
    }
    
    @IBAction private func buttonDidPress(_ sender: UIButton) {
        
        // MARK: Gets result from builder
        
        guard let order = orderBuilder.getResult() else {
            return
        }
        
        orderBuilder.reset()
        show(order)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DishCategory.allValues.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = DishCategory(rawValue: section) else {
            return 0
        }
        
        return DishGenerator.dishes(OfCategory: category).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = .black
        
        guard let category = DishCategory(rawValue: indexPath.section) else {
            return cell
        }
        
        if category == .sets {
            cell.backgroundColor = UIColor(named: NameOfColor.main)
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        }
        
        let dishes = DishGenerator.dishes(OfCategory: category)
        let dish = dishes[indexPath.row]
        cell.textLabel?.text = dish.name
        
        let price = NSDecimalNumber(value: dish.price)
        cell.detailTextLabel?.text = formatter.string(from: price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let category = DishCategory(rawValue: section) else {
            return nil
        }
        
        return DishGenerator.name(OfCategory: category)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let category = DishCategory(rawValue: indexPath.section) else {
            return
        }
        
        let dishes = DishGenerator.dishes(OfCategory: category)
        let dish = dishes[indexPath.row]
        
        guard category != .sets else {
            
            // MARK: Makes order by director
            
            let order = dish.name == "Breakfast".localized() ? orderDirector.makeBreakfast() : orderDirector.makeLanch()
            orderBuilder.reset()
            show(order)
            
            return
        }
        
        // MARK: Sets selected dish to order by builder
        
        switch category {
        case .firstCourses:
            orderBuilder.setFirstCourse(dish)
        case .mainCourses:
            orderBuilder.setMainCourse(dish)
        case .garnishes:
            orderBuilder.setGarnish(dish)
        case .drinks:
            orderBuilder.setDrink(dish)
        default:
            break
        }
    }
}
