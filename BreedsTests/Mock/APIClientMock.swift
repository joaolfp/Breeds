import Foundation
@testable import Breeds

final class APIClientMock: APIClientProtocol {
   
    var fileJson = String()
    var failure: Bool = false
    var isCancelled = false

    func request<T>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, APIError>) -> Void) where T: Decodable {

        guard !failure else {
            return completion(.failure(.jsonParsingFailure))
        }

        guard let decodable: T = JSONHelper.load(withFile: fileJson) else { return }
        if let value = decode?(decodable) {
            return completion(.success(value))
        }
        return completion(.success(decodable))
    }

    func cancelRequests() {
        self.isCancelled = true
    }
}
