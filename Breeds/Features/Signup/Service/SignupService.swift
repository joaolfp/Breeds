import Foundation

final class SignupService: SignupServiceProtocol {
    
    private let client: APIClientProtocol
    
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func signup(email: String, completion: @escaping (Result<SignupDTO, APIError>) -> Void) {
        let endpoint: SignupEndpoint = .signup(email: email)
        let request = endpoint.request
        
        client.request(request, completion: completion)
    }
}
