import Foundation

enum Result<T> {
    case success(T)
    case error(ServiceError)
}

struct OperationError: Error {
    var localizedDescription: String
}
