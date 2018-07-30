//
//  ViewController.swift
//  map
//
//  Created by Babak Nikkhoo on 6/14/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
        let latitude: CLLocationDegrees = 37.402741
        
        let longitude: CLLocationDegrees = -122.111582
        
        let latDelta: CLLocationDegrees = 0.01
        
        let lonDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Genio Inc."
        
        annotation.subtitle = "Titties home office"
        
        map.addAnnotation(annotation)
    
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.action(_:)))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
    }
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        
        print("Recognized")
        
        let touchPoint = gestureRecognizer.locationInView(self.map)
        
        let newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Place"
        
        annotation.subtitle = "Titties wants to go here!"
        
        map.addAnnotation(annotation)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print(locations)
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.01
        
        let lonDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        self.map.setRegion(region, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

