import XCTest
@testable import Breeds

class SignupServiceSpec: XCTestCase {
    
    var apiClientMock: APIClientMock!
    var sut: SignupService!

    override func setUp() {
        super.setUp()
        
        apiClientMock = APIClientMock()
        sut = SignupService(client: apiClientMock)
    }
    
    override func tearDown() {
        super.tearDown()
        
        apiClientMock = nil
        sut = nil
    }
    
    func testVerifyGetTokenWithSuccess() {
        apiClientMock.fileJson = "signup-response"
        
        sut.signup(email: "joao@uol.com") { result in
            switch result {
            case .success(let signup):
                let value = signup.user
                let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWViOTgxM2Q5Yjg0ZTYwZDZjY2E4M2FmIiwiaWF0IjoxNTg5MjE1NTQ5LCJleHAiOjE1OTA1MTE1NDl9.O3WuSre_dbNsleBMd05opC7ZQAsP0lZ1afbOu1dEYZ0"
                XCTAssertEqual(value.token, token)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
}
