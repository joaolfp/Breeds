import Foundation

enum APIScheme: String {
    case http
    case https

    func toString() -> String {
        return self.rawValue
    }
}
