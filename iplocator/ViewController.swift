//
//  ViewController.swift
//  iplocator
//
//  Created by derek quinn on 11/20/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocatorService.getIPLocation(ip: "24.48.0.1", locationCompletion: { userLocation in
            
            print("TILDA YOUR A GENIUS",userLocation.debugDescription)
            
        })
            
        }
        
        
    
}

