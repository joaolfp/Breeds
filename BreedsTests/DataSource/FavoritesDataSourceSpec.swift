import XCTest
@testable import Breeds

class FavoritesDataSourceSpec: XCTestCase {
    
    var favoritesView: FavoritesView!
    var favoritesList: [BreedEntity]!
    var sut: FavoritesDataSource!
    
    override func setUp() {
        super.setUp()
        
        favoritesView = FavoritesView()
        favoritesList = []
        sut = FavoritesDataSource(favoriteList: favoritesList, favoriteTableView: favoritesView.favoritesTableView)
    }

    override func tearDown() {
        super.tearDown()
        
        favoritesView = nil
        favoritesList = nil
        sut = nil
    }

    func testShouldHaveTheExpectedNumberOfItems() {
        let count = sut.tableView(favoritesView.favoritesTableView, numberOfRowsInSection: 0)
        XCTAssertEqual(count, favoritesList.count)
    }
    
    func testNumberOfRowsInSections() {
        let result = sut.tableView(sut.favoriteTableView, numberOfRowsInSection: 0)
        XCTAssertEqual(result, sut.favoriteList.count)
    }
}
