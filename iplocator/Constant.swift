//
//  Constant.swift
//  iplocator
//
//  Created by derek quinn on 11/20/20.
//

import Foundation

class Constant {
    
    static let ipApiBaseUrl: String = "http://ip-api.com/json/"
    static let michiganTestIp: String = "76.230.104.146"
    static let defaultCameraAltitude: Double = 15000
    static let incorrectCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyz~!@#$%^&*()_+")
    static let ipRegex: String = #"\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b"#
}
