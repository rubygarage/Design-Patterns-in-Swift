//
//  StrategyViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

private enum SortType: Int {
    case quick
    case merge
}

class StrategyViewController: UIViewController {
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var valueTextField: UITextField!
    @IBOutlet private weak var arrayTextView: UITextView!
    
    // MARK: Context that used in controller
    
    private var sortedArray = SortedArray<Int>()
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeNotifications()
        setupData()
    }
    
    // MARK: - Setup
    
    private func subscribeNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: .UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: .UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc private func adjustForKeyboard(notification: Notification) {
        guard let userInfo = notification.userInfo, let keyboardFrameEnd = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let keyboardFrameEndInWindow = view.convert(keyboardFrameEnd, from: view.window)
        
        if notification.name == .UIKeyboardWillHide {
            arrayTextView.contentInset = UIEdgeInsets.zero
        } else {
            arrayTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameEndInWindow.height, right: 0)
        }
        
        arrayTextView.scrollIndicatorInsets = arrayTextView.contentInset
        
        let selectedRange = arrayTextView.selectedRange
        arrayTextView.scrollRangeToVisible(selectedRange)
    }
    
    private func setupData() {
        
        // MARK: Sets up strategy of context
        
        sortedArray.sortStrategy = segmentedControl.selectedSegmentIndex == SortType.quick.rawValue ? QuickSort() : MergeSort()
        sortedArray.clear()
        
        setupTextView()
    }
    
    private func setupTextView() {
        arrayTextView.text = sortedArray.array.map { String($0) }.joined(separator: "\n")
    }

    // MARK: - Actions
    
    @IBAction private func segmentedControlValueDidChange(_ sender: UISegmentedControl) {
        view.endEditing(true)
        
        arrayTextView.text = nil
        
        setupData()
    }
    
    @IBAction private func addButtonDidPress(_ sender: UIButton) {
        guard let value = valueTextField.text, let number = Int(value) else {
            return
        }
        
        // MARK: Appedns array
        
        sortedArray.add(number)
        
        valueTextField.text = nil
        setupTextView()
    }
    
    @IBAction private func sortButtonDidPress(_ sender: UIButton) {
        view.endEditing(true)
        
        // MARK: Sort array
        
        sortedArray.sort()
        
        setupTextView()
    }
}
