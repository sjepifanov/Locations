import Foundation

enum Countries: String {
    case Estonia
    case Latvia
    case Lithuania
}

extension Countries {
    var baseUrl: String {
        switch self {
        case .Estonia: return "http://estonia"
        case .Latvia: return "http://latvia"
        case .Lithuania: return "http://lithuania"
        }
    }
    
    var name: String {
        switch self {
        case .Estonia: return "Estonia"
        case .Latvia: return "Latvia"
        case .Lithuania: return "Lithuania"
        }
    }
}
