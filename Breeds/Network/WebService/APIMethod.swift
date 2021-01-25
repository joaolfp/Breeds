import Foundation

enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"

    func toString() -> String {
        return self.rawValue
    }
}
