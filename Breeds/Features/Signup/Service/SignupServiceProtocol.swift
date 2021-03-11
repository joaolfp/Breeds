import Foundation

protocol SignupServiceProtocol {
    func signup(email: String, completion: @escaping (Result<SignupDTO, APIError>) -> Void)
}
