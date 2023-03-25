//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Bektur Mamytov on 21/3/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        //Add segmented control
        
        let segmentedControl = UISegmentedControl(items: ["Standart", "Hybrid", "Sattelite"])
        segmentedControl.backgroundColor = .systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        // Creating constraints
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        //Activating constraints
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .hybrid
            case 2:
                mapView.mapType = .satellite
            default:
                break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //Check for location services
        DispatchQueue.global().async {
            if (CLLocationManager.locationServicesEnabled()) {
                locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
            }
        }
        
        //Zoom to user location
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(viewRegion, animated: false)
        }
        
        self.locationManager = locationManager
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MapViewController loaded again")
    }

}
