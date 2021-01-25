import XCTest
@testable import Breeds

class BreedsServiceSpec: XCTestCase {
    
    var apiClientMock: APIClientMock!
    var sut: BreedsService!
    
    override func setUp() {
        super.setUp()
        
        apiClientMock = APIClientMock()
        sut = BreedsService(client: apiClientMock)
    }

    override func tearDown() {
        super.tearDown()
        
        apiClientMock = nil
        sut = nil
    }
    
    func testVerifyGetBreedsListWithSuccess() {
        apiClientMock.fileJson = "breeds-list"
        
        sut.getBreadsList { result in
            switch result {
            case .success(let breeds):
                XCTAssertEqual(breeds[0].name, "Affenpinscher")
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

}
