//
//  CommandViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class CommandViewController: UIViewController {
    @IBOutlet private weak var textField: UITextField!
    
    // MARK: Command hidtory that used for undo operation
    
    private let history = StringCommandHistory()
    
    // MARK: - Setup

    private func execute(_ command: StringCommand) {
        
        // MARK: Pushes command if it was executed successfully
        
        if command.execute() {
            history.push(command)
        }
    }

    // MARK: - Actions
    
    @IBAction private func copyButtonDidPress(_ sender: UIButton) {
        
        // MARK: Creates and executes copy command
        
        let command = CopyCommand()
        command.textField = textField
        execute(command)
    }
    
    @IBAction private func pasteButtonDidPress(_ sender: UIButton) {
        
        // MARK: Creates and executes paste command
        
        let command = PasteCommand()
        command.textField = textField
        execute(command)
    }
    
    @IBAction private func undoButtonDidPress(_ sender: UIButton) {
        
        // MARK: Makes undo operation
        
        if let command = history.pop() {
            command.undo()
        }
    }
}
