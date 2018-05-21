//
//  MementoViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class MementoViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var toTextField: UITextField!
    @IBOutlet private weak var subjectTextField: UITextField!
    @IBOutlet private weak var bodyTextView: UITextView!
    
    // MARK: Originator that used in controller
    
    private var editor = EmailEditor()
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subscribeNotifications()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let email = restoreEmail() {
            setupTextFields(with: email)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        setupEditorWithContentOfTextFields()
        saveEmail()
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
            bodyTextView.contentInset = UIEdgeInsets.zero
        } else {
            bodyTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameEndInWindow.height, right: 0)
        }
        
        bodyTextView.scrollIndicatorInsets = bodyTextView.contentInset
        
        let selectedRange = bodyTextView.selectedRange
        bodyTextView.scrollRangeToVisible(selectedRange)
    }
    
    private func restoreEmail() -> Email? {
        
        // MARK: Gets snapshot from caretaker and uses it to restore email by originator
        
        guard let snapshot = EmailSnapshotManager.sharedInstance.pop() else {
            return nil
        }
        
        return editor.restore(from: snapshot)
    }
    
    private func setupTextFields(with email: Email) {
        toTextField.text = email.to
        subjectTextField.text = email.subject
        bodyTextView.text = email.body
    }
    
    private func setupEditorWithContentOfTextFields() {
        editor.setTo(toTextField.text)
        editor.setSubject(subjectTextField.text)
        editor.setBody(bodyTextView.text)
    }
    
    private func saveEmail() {
        
        // MARK: Gets snapshot from originator and saves it by caretaker
        
        let snapshot = editor.save()
        EmailSnapshotManager.sharedInstance.push(snapshot)
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
