import Foundation

protocol AnyCountry {
    var name: String { get }
    var regions: [String: [AnyLocation]] { get set }
}

extension AnyCountry {
    mutating func addLocation(_ location: AnyLocation, to region: String) {
        if let index = regions.index(forKey: region) {
            var locations = regions[index].value
            locations.append(location)
            regions.updateValue(locations, forKey: region)
        }
        else {
            regions.updateValue([location], forKey: region)
        }
    }
}

struct Country: AnyCountry {
    let name: String
    var regions: [String: [AnyLocation]]
}

extension Country {
    init(_ name: String) {
        self.name = name
        self.regions = [String: [AnyLocation]]()
    }
}
