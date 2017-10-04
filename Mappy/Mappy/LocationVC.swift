//
//  SecondViewController.swift
//  Mappy
//
//  Created by Abhishek on 16/09/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var map: MKMapView!
    
    let regionRadius: CLLocationDistance = 20000
    let locationManager = CLLocationManager()
    let addresses = ["Dr.Annie Besant Road, Love Grove Flyover, Siddharth Nagar, Worli, Siddharth Nagar, Worli, Mumbai, Maharashtra 400018","87, Chapel Road, Rose Minar Annexe, Reclamation, Bandra West, Sayed Wadi, A Block BKC, Bandra West, Mumbai, Maharashtra 400050", "Lal Bahadur Shastri Marg, Kamani, Kurla West, Kurla, Mumbai, Maharashtra 400070", "Level 2, Rampart Row, 30 , K Dubash Marg, Above Royal Oak Banquets, Kala Ghoda, Fort, Kala Ghoda, Fort, Mumbai, Maharashtra 400023"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        map.delegate = self
        
        for add in addresses {
            getPlacemarkFromAddress(add)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        locationAuthStatus()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
   
    
    func locationAuthStatus () {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            map.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    
    func centerMapOnLocation (location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2 , regionRadius * 2)
        map.setRegion(coordinateRegion, animated: true)
    }

    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        
        if let loc = userLocation.location {
            centerMapOnLocation(loc)
        }
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKindOfClass(RestaurantAnnotation) {
            let annoView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Default")
            annoView.pinTintColor = UIColor.blackColor()
            annoView.animatesDrop = true
            annoView.image = UIImage(named: "sunkissed.jpg")
            return annoView
        } else if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        return nil
    }
    
    
    func createAnnotationForLocation(location: CLLocation) {
        let restaurant = RestaurantAnnotation(coordinate: location.coordinate)
        map.addAnnotation(restaurant)
    }

    
    func getPlacemarkFromAddress (address: String) {
        CLGeocoder().geocodeAddressString(address) { (placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if let marks = placemarks where marks.count > 0{
                if let loc = marks[0].location {
                    //We have a valid location here.
                    self.createAnnotationForLocation(loc)
                }
            }
        }
    }
    
    
}

















