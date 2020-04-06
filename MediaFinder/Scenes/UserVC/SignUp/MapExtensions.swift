//
//  MapExtensions.swift
//  firstPractice
//
//  Created by Eslam Sebaie on 3/16/20.
//  Copyright © 2020 Eslam Sebaie. All rights reserved.
//

import Foundation
import UIKit
import MapKit
extension MapVC: CLLocationManagerDelegate {
    
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        guard let location = locations.last else{return}
    //        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    //        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    //        mapView.setRegion(region, animated: true)
    //
    //    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}
extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geocoder = CLGeocoder()
        guard let previousLocation = self.previousLocation else {return}
        guard center.distance(from: previousLocation) > 50 else {return}
        self.previousLocation = center
        
        geocoder.reverseGeocodeLocation(center) {[weak self] (placemarks, error) in
            guard let self = self else {return}
            
            if let _  = error {
                
                return
            }
            
            guard let placemark = placemarks?.first else {
                
                return
            }
            let streetNumber = placemark.subThoroughfare
            let streetName = placemark.thoroughfare
            DispatchQueue.main.async {
                
                self.adrressLabel.text = "\(streetNumber ?? "") \(streetName ?? "")"
            }
        }
        
    }
}
