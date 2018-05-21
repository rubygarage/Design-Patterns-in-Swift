//
//  AdapterViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import EventKit
import UIKit

class AdapterViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        
        return dateFormatter
    }()
    
    private lazy var event: EKEvent = {
        let eventStore = EKEventStore()
        let event = EKEvent(eventStore: eventStore)
        event.title = "Design Pattern Meetup"
        event.startDate = dateFormatter.date(from: "06-29-2018 18:00")
        event.endDate = dateFormatter.date(from: "06-29-2018 19:30")
        
        return event
    }()
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: - Setup
    
    private func setupViews() {
        
        // MARK: Creates adapter and uses it to adapt event
        
        let adapter = EKEventAdapter(event: event)
        label.text = adapter.description
    }
}
