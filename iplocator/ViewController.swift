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
    //   @IBOutlet var userEnteredIp: UITextField!
    
    private var ipCoordinates: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func locateButtonPressed() {
        
        LocationService.getIPLocation(ip: Constant.michiganTestIp, locationCompletion: { userLocation in
            
            LocationHelper.updateLocation(latitude: userLocation[0], longitude: userLocation[1], mapOfIpLocation: self.mapOfIPLocation)
            
        })
    }
}

