import Foundation

struct Model {
    let regions: [ModelRegion]
}

struct ModelRegion: AnyRegion {
    private(set) var locations: [String : [AnyLocation]]
}

struct ModelLocation: AnyLocation {
    var name: String
    var address: String
    var type: LocationType
    var lattitude: Double
    var longitude: Double
    var availability: String?
    var info: String?
    var isCashOperationAvailable: Bool
    var isCoinStationAvailable: Bool
}

extension Model: Decodable {
    enum ModelKeys: String, CodingKey {
        case region = "r"
        case name = "n"
        case address = "a"
        case type = "t"
        case lattitude = "lat"
        case longitude = "lon"
        case availability = "av"
        case info = "i"
        case isCashOperationAvailable = "ncash"
        case isCoinStationAvailable = "cs"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ModelKeys.self)
        let region = try container.decode(String.self, forKey: .region)
        let name = try container.decode(String.self, forKey: .name)
        let address = try container.decode(String.self, forKey: .address)
        let type = try container.decode(Int.self, forKey: .type)
        let lattitude = try container.decode(Double.self, forKey: .lattitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        let availability = try? container.decode(String.self, forKey: .availability)
        let info = try? container.decode(String.self, forKey: .info)
        let isCashOperationAvailable = try container.decode(Bool.self, forKey: .isCashOperationAvailable)
        let isCoinStationAvailable = try container.decode(Bool.self, forKey: .isCoinStationAvailable)
        
        func makeRegion() -> ModelRegion {
            let location = ModelLocation(name: name,
                                         address: address,
                                         type: LocationType(rawValue: type)!,
                                         lattitude: lattitude,
                                         longitude: longitude,
                                         availability: availability,
                                         info: info,
                                         isCashOperationAvailable: isCashOperationAvailable,
                                         isCoinStationAvailable: isCoinStationAvailable)
            let region = ModelRegion(locations: [region: [location]])
            return region
        }
        self.init(regions: [makeRegion()])
    }
}
