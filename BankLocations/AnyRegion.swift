import Foundation

protocol AnyRegion {
    var locations: [String: [AnyLocation]] { get }
}
