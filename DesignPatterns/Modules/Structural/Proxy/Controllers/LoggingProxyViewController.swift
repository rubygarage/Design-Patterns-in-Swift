//
//  LoggingProxyViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/21/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import MapKit
import UIKit

class LoggingProxyViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet weak var logsTextView: UITextView!
    
    private let mapViewDelta = 0.005
    private let annotationSize: CGFloat = 10
    
    private var isUpdateLocationOnce = false
    
    // MARK: Proxy that used in controller
    
    private var locationServiceProxy: LocationServiceProxy!

    // MARK: - View controller lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupLocationService()
    }
    
    // MARK: - Setup
    
    private func setupLocationService() {
        
        // MARK: Inits proxy with real service object
        
        let locationService = LocationService()
        locationServiceProxy = LocationServiceProxy(locationService: locationService)
        
        // MARK: Gets data from real service by proxy
        
        locationServiceProxy.locationDidUpdate = { [weak self] location in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.replaceAnnotations(with: location)
            strongSelf.setRegionIfNeeded(location)
        }
        
        // MARK: Gets logs from proxy
        
        locationServiceProxy.logsDidAppend = { [weak self] log in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.appendLogs(with: log)
        }
    }
    
    private func replaceAnnotations(with location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotation(annotation)
    }
    
    private func setRegionIfNeeded(_ location: CLLocation) {
        guard !isUpdateLocationOnce else {
            return
        }
        
        isUpdateLocationOnce = true
        
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: mapViewDelta, longitudeDelta: mapViewDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func appendLogs(with log: String) {
        if !logsTextView.text.isEmpty {
            logsTextView.text.append("\n")
        }
        
        logsTextView.text.append(log)
        
        let y = logsTextView.contentSize.height - logsTextView.frame.size.height
        
        guard y >= 0 else {
            return
        }
        
        let contentOffset = CGPoint(x: 0, y: y)
        logsTextView.setContentOffset(contentOffset, animated: true)
    }
    
    // MARK: - MKMapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        annotationView.frame = CGRect(x: 0, y: 0, width: annotationSize, height: annotationSize)
        annotationView.layer.cornerRadius = annotationSize / 2
        annotationView.backgroundColor = UIColor(named: NameOfColor.main)
        annotationView.canShowCallout = false
        
        return annotationView
    }
}
