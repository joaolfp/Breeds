import XCTest
@testable import Breeds

class BreedsDataSourceSpec: XCTestCase {
    
    var breedsView: BreedsView!
    var breedsList: [BreedsDTO]!
    var sut: BreedsDataSource!
    
    override func setUp() {
        super.setUp()
        
        breedsView = BreedsView()
        breedsList = []
        sut = BreedsDataSource(breedsCollections: breedsView.breedsCollections, breedsList: breedsList)
    }

    override func tearDown() {
        super.tearDown()
        
        breedsView = nil
        breedsList = nil
        sut = nil
    }

    func testShouldHaveTheExpectedNumberOfItems() {
        let count = sut.collectionView(breedsView.breedsCollections, numberOfItemsInSection: 0)
        XCTAssertEqual(count, breedsList.count)
    }
    
    func testShouldHaveAConfiguredCell() {
        sut.breedsList = [.stub(id: 2,
                                name: "Cachorro",
                                temperament: "Tranquilo",
                                description: "Descrição",
                                life_span: "10-50",
                                image: .stub(url: "www.google.com"),
                                weight: .stub(metric: "2", imperial: "2"),
                                height: .stub(metric: "2", imperial: "2"))]
        
        let index = IndexPath(row: 0, section: 0)
        
        breedsView.breedsCollections.registerCell(cellType: BreedsViewCell.self)
        let result = sut.collectionView(sut.breedsCollections, cellForItemAt: index)
                        
        XCTAssertTrue(result is BreedsViewCell)
    }
    
    func testNumberOfRowsInSections() {
        let result = sut.collectionView(sut.breedsCollections, numberOfItemsInSection: 0)
        XCTAssertEqual(result, sut.breedsList.count)
    }
}
