import Foundation

extension String {
    var boolValue: Bool {
        switch self.lowercased() {
        case "true", "yes", "1":
            return true
        default:
            return false
        }
    }
}
