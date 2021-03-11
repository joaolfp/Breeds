import Foundation

enum SignupEndpoint {
    case signup(email: String)
}

extension SignupEndpoint: EndpointProtocol {
    var scheme: APIScheme {
        return .https
    }
    
    var host: String {
        return "iddog-nrizncxqba-uc.a.run.app"
    }
    
    var path: String {
        return "/signup"
    }
    
    var parameters: APIParameters? {
        switch self {
        case .signup(let email):
            return ["email": email]
        }
    }
    
    var method: APIMethod {
        return .post
    }
    
    var headers: HTTPHeaders? {
        return ["Content-type": "application/json"]
    }
}
