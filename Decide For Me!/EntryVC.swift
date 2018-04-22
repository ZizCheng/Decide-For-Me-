//
//  ViewController.swift
//  Decide For Me!
//
//  Created by Zizheng Cheng on 4/21/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

import UIKit
import CoreLocation

class EntryVC: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var latitude = "32.1"
    var longitude = "-122.58"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
    }
    
    @IBAction func request(_ sender: Any)
    {
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        check()
    }
    func check()
    {
        if (CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse)
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SVC") as! SuggestionVC
            vc.long = longitude
            vc.lat = latitude
            self.present(vc, animated: false, completion: nil)
        }
        else
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DLVC") as! DeclineLocationVC
            self.present(vc, animated: false, completion: nil)
        }
    }
    
    private func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined: //NANI
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedWhenInUse: //GOOD
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingLocation()
            break
        case .authorizedAlways: //GOOD
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingLocation()
            break
        case .restricted: //BAD
            break
        case .denied: //BAD
            break
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        self.latitude = "" + "\(userLocation.coordinate.latitude)"
        self.longitude = "" + "\(userLocation.coordinate.longitude)"
        manager.stopUpdatingLocation()
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}

