import Foundation

protocol Database {
    func loadObjects<T: Model>(matching query: Query) -> [T]
    func loadObject<T: Model>(matching id: String) -> T?
    func save<T: Model>(_ object: T)
}

enum Query: String {
    case Country
    case Region
    case Location
}
