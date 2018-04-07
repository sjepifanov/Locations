import Foundation

protocol NetworkRequest {
    associatedtype RequestResult
    func load(with completion: @escaping (Result<RequestResult>) -> Void)
}
