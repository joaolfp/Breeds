import XCTest
@testable import Breeds

class FavoritesDataSourceSpec: XCTestCase {
    
    var favoritesView: FavoritesView!
    var favoritesList: [BreedEntity]!
    var searchBar: UISearchBar!
    var filteredFavorite: [BreedEntity]!
    var inSearchMode: Bool!
    var sut: FavoritesDataSource!
    
    override func setUp() {
        super.setUp()
        
        favoritesView = FavoritesView()
        favoritesList = []
        searchBar = UISearchBar()
        filteredFavorite = []
        inSearchMode = true
        sut = FavoritesDataSource(favoriteList: favoritesList, favoriteTableView: favoritesView.favoritesTableView, searchBar: searchBar,
                                  filteredFavorite: filteredFavorite, inSearchMode: inSearchMode)
    }

    override func tearDown() {
        super.tearDown()
        
        favoritesView = nil
        favoritesList = nil
        searchBar = nil
        filteredFavorite = nil
        inSearchMode = nil
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
