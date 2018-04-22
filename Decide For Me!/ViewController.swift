//
//  ViewController.swift
//  Decide For Me!
//
//  Created by Zizheng Cheng on 4/21/18.
//  Copyright © 2018 Lifely. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var latitude = "32.1"
    var longitude = "-122.58"
        
    @IBOutlet weak var recommendation: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        
        
    }
    
    
    @IBAction func touchButton1(_ sender: Any) {
        determineMyCurrentLocation()
        let restaurantfinder = RestaurantFinder(Latitude: latitude, Longitude: longitude)
        restaurantfinder.getOne(completion: {restaurant in
            DispatchQueue.main.async {
                self.recommendation.text =
                    restaurant.name!
                    + "\n\(restaurant.price!)"
                    + "\n\(restaurant.rating!)/5"
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
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
    }
    

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}

