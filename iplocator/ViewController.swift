//
//  ViewController.swift
//  iplocator
//
//  Created by derek quinn on 11/20/20.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var mapOfIPLocation: MKMapView!
 
    private var ipCoordinates: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocationService.getIPLocation(ip: Constant.michiganTestIp, locationCompletion: { userLocation in
            
            LocationHelper.updateLocation(latitude: userLocation[0], longitude: userLocation[1], mapOfIpLocation: self.mapOfIPLocation)
        
        })
    }
}

