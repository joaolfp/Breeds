import Foundation

enum BreedsEndpoint {
    case getBreeds
}

extension BreedsEndpoint: EndpointProtocol {
    var scheme: APIScheme {
        return .https
    }
    
    var host: String {
        return "api.thedogapi.com"
    }
    
    var path: String {
        switch self {
        case .getBreeds:
            return "/v1/breeds"
        }
    }
    
    var parameters: APIParameters? {
        return ["api_key": "129d98df-7657-49e0-95ae-5b94116881ae%27"]
    }
    
    var method: APIMethod {
        switch self {
        case .getBreeds:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Content-type": "application/json"]
    }
}
