//
//  mapViewController.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 2/26/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
protocol sendingAddress {
    func send(address: String)
}
class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var adrressLabel: UILabel!
     var delegate: sendingAddress?
    
    let locationManager = CLLocationManager()
    var previousLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        mapView.delegate = self
        checkLocationService()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        saveButton.layer.cornerRadius = 23.0
        saveButton.layer.masksToBounds = true
    }
    
    func setupLocationManger(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location , latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
    }
    func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            // once we have authorization
            startTrackingUserLocation()
        case .denied:
            //not allowed not give this permission and show alert to show how turn on permission
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
        
    }
    
    func startTrackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(mapView: mapView)
    }
    
    func checkLocationService() {
        
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManger()
            checkLocationAuthorization()
        }
        else {
            print("errorSERVICE")
        }
        
    }
    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        
        let latitude = mapView.centerCoordinate.latitude
        let longtiude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longtiude)
        
    }
    
    @IBAction func saveAddressButton(_ sender: Any) {
        
        self.delegate?.send(address: adrressLabel.text ?? "eslam")
        dismiss(animated: true, completion: nil)
        
    }
    

    

}

