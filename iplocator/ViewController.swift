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
    @IBOutlet var userEnteredIp: UITextField!
    
    let regex = NSRegularExpression(Constant.ipRegex)
    
    private var ipCoordinates: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func locateIPPress(_ sender: UIButton){
        
        guard let ip = userEnteredIp.text else {
            print("[Error] - userEnteredIp.text != ip")
            return
        }
        
        if regex.matches(ip){
            print("[True] - IP regex.matches(ip)")
            LocationService.getIPLocation(ip: ip, locationCompletion: { userLocation in
                LocationHelper.updateLocation(latitude: userLocation[0], longitude: userLocation[1], mapOfIpLocation: self.mapOfIPLocation)
            })
        } else {
            print ("[False] - IP regex.matches(ip)")
        }
    }
}

extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("[Error] - Illegal regular expression: \(pattern).")
        }
    }
}

