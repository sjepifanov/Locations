import Foundation

enum ServiceError: Error {
    case noInternetConnection
    case custom(String)
    case unhandled
}

extension ServiceError {
    var errorDescription: String {
        switch self {
        case .noInternetConnection:
            return "No Internet connection"
        case .custom(let message):
            return message
        case .unhandled:
            return "Something went wrong."
        }
    }
}

func showError() {
    let error = ServiceError.custom("ERROR")
    print(error.localizedDescription)
}
