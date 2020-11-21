//
//  APIService.swift
//  iplocator
//
//  Created by derek quinn on 11/20/20.
//

import Foundation
import UIKit

class LocationService {
    
    static func getIPLocation(ip: String, locationCompletion: @escaping ([Double]) -> Void) {
        
        var userLocation: [Double] = []
        
        let url = Constant.ipApiBaseUrl + ip
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("URLSession datatask() failed", error as Any)
                return
            }
            
            do {
                
                let response: LocationResponse = try JSONDecoder().decode(LocationResponse.self, from: data)
                
                userLocation.append(response.lat)
                userLocation.append(response.lon)
                
                locationCompletion(userLocation)
                
            } catch {
                print("JSONDecoding failed from url: \(url)", error)
            }
        }).resume()
        
    }
    
//    static func displayInvalidIpAlert(){
//        
//        let invalidIpAlert =  UIAlertController(title: "INVALID INPUT", message: "time to be a dog girl", preferredStyle: .alert)
//        
//        let tryAgainButton = UIAlertAction(title: "Try Again", style: .default, handler: { (action) -> Void in
//            print("Ok button tapped")
//         })
//        
//        invalidIpAlert.addAction(tryAgainButton)
//        invalidIpAlert.present(invalidIpAlert, animated: true, completion: nil)
//      
//    }
}
