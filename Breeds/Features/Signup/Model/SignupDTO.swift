import Foundation

struct SignupDTO: Codable {
    var user: UserResponse
}

struct UserResponse: Codable {
    var token: String
}
