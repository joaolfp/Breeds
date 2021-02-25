import Foundation

final class BreedsService: BreedsServiceProtocol {
    
    private let client: APIClientProtocol
    
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func getBreadsList(completion: @escaping (Result<[BreedsDTO], APIError>) -> Void) {
        let endpoint: BreedsEndpoint = .getBreeds
        let request = endpoint.request
        
        client.request(request, completion: completion)
    }
}
