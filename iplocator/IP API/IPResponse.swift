
import Foundation

struct IPResponse: Codable {
    let status, country, countryCode, region: String?
    let regionName, city, zip: String?
    let lat, lon: Double
    let timezone, isp, org, welcomeAs: String?
    let query: String?
}
