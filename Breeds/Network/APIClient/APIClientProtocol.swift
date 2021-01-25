import Foundation

protocol APIClientProtocol {
    func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, APIError>) -> Void)
    func cancelRequests()
}

extension APIClientProtocol {

    func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
        self.request(request, decode: decode, completion: completion)
    }
}
