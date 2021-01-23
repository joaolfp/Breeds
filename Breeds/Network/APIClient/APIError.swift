import Foundation

enum APIError: Error {
    case requestFailed(reason: String?)
    case jsonConversionFailure
    case responseUnsuccessful
    case invalidData
    case jsonParsinFailure
    case requestCancelled
    
    var localizedDescription: String {
        switch self {
        case .requestFailed(let reason):
            return "Request Failed: \(reason ?? "unknown")"
        case .jsonParsinFailure:
            return "JSON parsing failure"
        case .jsonConversionFailure:
            return "JSON conversion failure"
        case .responseUnsuccessful:
            return "Response unsuccessful"
        case .invalidData:
            return "Invalid data"
        case .requestCancelled:
            return "Request cancelled"
        }
    }
}
