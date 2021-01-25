import XCTest
@testable import Breeds

class BreedsListViewControllerSpec: XCTestCase {
    
    var sut: BreedsListViewController!

    override func setUp() {
        super.setUp()
        
        sut = BreedsListViewController()
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    func testShouldBeAbleToCreateAController() {
        XCTAssertNotNil(sut)
    }
        
    func testLifecycle() {
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        let breedsDataSource = BreedsDataSource(breedsCollections: sut.breedsView.breedsCollections, breedsList: sut.breedsList)
        
        var dataSource = sut.breedsView.breedsCollections.dataSource
        var delegate = sut.breedsView.breedsCollections.delegate
        
        dataSource = breedsDataSource
        delegate = breedsDataSource
                
        XCTAssertNotNil(dataSource)
        XCTAssertNotNil(delegate)
    }
}
