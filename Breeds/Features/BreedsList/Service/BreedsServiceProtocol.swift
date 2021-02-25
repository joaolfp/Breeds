import Foundation

protocol BreedsServiceProtocol {
    func getBreadsList(completion: @escaping (Result<[BreedsDTO], APIError>) -> Void)
}
