//
//  LocationHelper.swift
//  iplocator
//
//  Created by derek quinn on 11/21/20.
//

import Foundation
import MapKit

class LocationHelper {
    
    static func updateLocation(latitude: Double, longitude: Double, mapOfIpLocation: MKMapView) {
        
        DispatchQueue.main.async {
            let currentLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            
            mapOfIpLocation.setCenter(currentLocation, animated: true)
            mapOfIpLocation.camera.altitude = Constant.defaultCameraAltitude
        }
    }
}
