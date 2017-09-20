import Foundation

protocol AnyLocation {
    var name: String { get }
    var address: String { get }
    var type: LocationType { get }
    var lattitude: Double { get }
    var longitude: Double { get }
    var availability: String? { get }
    var info: String? { get }
    var isCashOperationAvailable: Bool { get }
    var isCoinStationAvailable: Bool { get }
}

struct Location: AnyLocation {
    let name: String
    let address: String
    let type: LocationType
    let lattitude: Double
    let longitude: Double
    let availability: String?
    let info: String?
    let isCashOperationAvailable: Bool
    let isCoinStationAvailable: Bool
}

extension Location {
    init?(_ location: [String: Any]) {
        guard
            let name = location["n"] as? String,
            let address = location["a"] as? String,
            let type = location["t"] as? Int,
            let locationType = LocationType(rawValue: type),
            let lattitude = location["lat"] as? Double,
            let longitude = location["lon"] as? Double
        else {
            return nil
        }
        
        self.lattitude = lattitude
        self.longitude = longitude
        self.name = name
        self.address = address
        self.type = locationType
        self.availability = location["av"] as? String
        self.info = location ["i"] as? String
        self.isCashOperationAvailable = (location["ncash"] as? Bool) ?? false
        self.isCoinStationAvailable = (location["cs"] as? Bool) ?? false
    }
}

enum LocationType: Int {
    case branch
    case atm
    case bna
}

extension LocationType {
    var fullDescription: String {
        switch self {
        case .branch: return "Branch"
        case .atm: return "Automated Teller Machine"
        case .bna: return "Bunch Note Acceptor"
        }
    }
    
    var shortDescription: String {
        switch self {
        case .branch: return "Branch"
        case .atm: return "ATM"
        case .bna: return "BNA"
        }
    }
}
