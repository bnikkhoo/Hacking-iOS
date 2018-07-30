//
//  ViewController.swift
//  Memorable Places
//
//  Created by Babak Nikkhoo on 6/20/16.
//  Copyright © 2016 Babak Nikkhoo. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager: CLLocationManager!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if activePlace == -1 {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            let latitude = NSString(string: places[activePlace]["lat"]!).doubleValue
            let longitude = NSString(string: places[activePlace]["lon"]!).doubleValue
            let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            let latDelta:CLLocationDegrees = 0.01
            let lonDelta:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
            self.map.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = places[activePlace]["name"]
            self.map.addAnnotation(annotation)
        }
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.action(_:)))
        uilpgr.minimumPressDuration = 2.0
        map.addGestureRecognizer(uilpgr)
    }
    
    func action(gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            let touchPoint = gestureRecognizer.locationInView(self.map)
            let newCoordinate = self.map.convertPoint(touchPoint, toCoordinateFromView: self.map)
            let location = CLLocation(latitude: newCoordinate.latitude, longitude: newCoordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                var title = ""
                if (error == nil) {
                    if let pm = placemarks{
                        let p = CLPlacemark(placemark:pm[0])
                        var subThoroughfare = ""
                        var thoroughfare = ""
                        if p.subThoroughfare != nil { subThoroughfare = p.subThoroughfare! }
                        if p.thoroughfare != nil { thoroughfare = p.thoroughfare! }
                        print(p.subThoroughfare)
                        print(p.thoroughfare)
                        title = "\(subThoroughfare) \(thoroughfare)"
                    }
                }
                if title == " " { title = "Added \(NSDate())" }
                places.append(["name":title, "lat":"\(newCoordinate.latitude)", "lon":"\(newCoordinate.longitude)"])
                self.saveStorage()
                let annotation = MKPointAnnotation()
                annotation.coordinate = newCoordinate
                annotation.title = title
                self.map.addAnnotation(annotation)
            })
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        let latDelta:CLLocationDegrees = 0.01
        let lonDelta:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(coordinate, span)
        self.map.setRegion(region, animated: true)
    }
    
    func saveStorage() {
        let userStorage = NSUserDefaults.standardUserDefaults()
        userStorage.setObject(places, forKey: "places")
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
}