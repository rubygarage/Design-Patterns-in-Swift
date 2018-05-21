//
//  FacadeViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/5/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import UIKit

class FacadeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AudioFacadeDelegate {
    @IBOutlet private weak var tableView: UITableView!
    
    private let cellIdentifier = "record"
    
    // MARK: Facade that used in controller
    
    private var audioFacade: AudioFacade!
    
    // MARK: - Controller view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
    }
    
    // MARK: - Setup
    
    private func setupData() {
        
        // MARK: Works with facade instead audio session service
        
        audioFacade = AudioFacade()
        audioFacade.delegate = self
        
        tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @IBAction private func recordButtonDidPress(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        // MARK: Works with facade instead recorder service
        
        if sender.isSelected {
            audioFacade.startRecord()
        } else {
            audioFacade.stopRecord()
            
            tableView.reloadData()
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // MARK: Works with facade instead file service
        
        return audioFacade.numberOfRecords()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        // MARK: Works with facade instead file service
        
        cell.textLabel?.text = audioFacade.nameOfRecord(at: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        
        // MARK: Works with facade instead file service
        
        audioFacade.removeRecord(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // MARK: Works with facade instead file service and player service
        
        audioFacade.playRecord(at: indexPath.row)
    }
    
    // MARK: - AudioFacadeDelegate
    
    func audioFacadePlayingDidFinish(_ audioFacade: AudioFacade) {
        let indexPath = tableView.indexPathForSelectedRow!
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
