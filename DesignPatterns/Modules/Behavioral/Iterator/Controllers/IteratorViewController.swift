//
//  IteratorViewController.swift
//  DesignPatterns
//
//  Created by Radyslav Krechet on 3/26/18.
//  Copyright © 2018 RubyGarage. All rights reserved.
//

import MapKit
import UIKit

class IteratorViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet private weak var mapView: MKMapView!
    
    private let mapViewDelta = 0.005
    private let annotationSize: CGFloat = 10
    private let rendererLineWidth: CGFloat = 2.5
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addRoute()
    }
    
    // MARK: - Setup
    
    private func addRoute() {
        
        // MARK: Creates and uses iterator
        
        let route = Route(locations: LocationGenerator.locations)
        let iterator = route.makeIterator()
        var previousCoordinate: CLLocationCoordinate2D?
        
        while let coordinate = iterator.next() {
            guard let coordinate = coordinate as? CLLocationCoordinate2D else {
                return
            }
            
            addAnnotation(with: coordinate)
            
            if let previousCoordinate = previousCoordinate {
                addPolyline(with: previousCoordinate, destinationCoordinate: coordinate)
            } else {
                setRegion(with: coordinate)
            }
            
            previousCoordinate = coordinate
        }
    }
    
    private func addAnnotation(with coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    private func setRegion(with coordinate: CLLocationCoordinate2D) {
        let center = coordinate
        let span = MKCoordinateSpan(latitudeDelta: mapViewDelta, longitudeDelta: mapViewDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func addPolyline(with sourceCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: sourcePlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate { [weak self] (response, _) in
            guard let strongSelf = self, let response = response, let polyline = response.routes.first?.polyline else {
                return
            }
            
            strongSelf.mapView.add(polyline)
        }
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
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(named: NameOfColor.main)
        renderer.lineWidth = rendererLineWidth
        return renderer
    }
}
