//
//  APIService.swift
//  iplocator
//
//  Created by derek quinn on 11/20/20.
//

import Foundation

class APIService {
    
    static func getIPLocation(ip: String, location: [Double]){
        
        var userLocation: [Double] = []
        
        let url = Constant.ipApiBaseUrl + ip
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                print("URLSession datatask() failed", error as Any)
                return
            }
            
            do {
                print("startdo")
                let response: IPResponse = try JSONDecoder().decode(IPResponse.self, from: data)
                print("DAAAATA",data.debugDescription)
                userLocation.append(response.lat)
                userLocation.append(response.lon)
                print(userLocation.debugDescription)
                
            } catch {
                print("JSONDecoding failed from url: \(url)", error)
            }
        }).resume()
        
    }
}
