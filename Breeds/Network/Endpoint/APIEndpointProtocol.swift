import Foundation

public typealias HTTPHeaders = [String: String]
public typealias APIParameters = [String: String]

protocol EndpointProtocol {
    var scheme: APIScheme { get }
    var host: String { get }
    var path: String { get }
    var parameters: APIParameters? { get }
    var method: APIMethod { get }
    var headers: HTTPHeaders? { get }
}

extension EndpointProtocol {
    var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme.toString()
        components.host = host
        components.path = path
        components.queryItems = parameters?.queryItems
        return components
    }

    var request: URLRequest {
        var request = URLRequest(with: urlComponents.url)
        request.httpMethod = method.toString()
        
        if let parameters = parameters {
            do {
                if method != .get {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                }
            } catch {
                print("Error json")
            }
        }
        
        request.allHTTPHeaderFields = headers
        return request
    }
}
