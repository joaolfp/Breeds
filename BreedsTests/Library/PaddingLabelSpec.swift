import XCTest
@testable import Breeds

class PaddingLabelSpec: XCTestCase {
    
    var sut: PaddingLabel!

    override func setUp() {
        super.setUp()
        sut = PaddingLabel(top: 16, bottom: 16, left: 8, right: 16)
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testVerifyAddPaddingWithSuccess() {
        XCTAssertEqual(sut.topInset, 16)
        XCTAssertEqual(sut.leftInset, 8)
        XCTAssertEqual(sut.rightInset, 16)
        XCTAssertEqual(sut.bottomInset, 16)
    }
}
