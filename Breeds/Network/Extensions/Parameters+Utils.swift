import Foundation

extension APIParameters {
    var queryItems: [URLQueryItem] {
        return compactMap { URLQueryItem(name: $0, value: $1) }
    }
}
