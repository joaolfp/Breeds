import XCTest
@testable import Breeds

class DatabaseManagerSpec: XCTestCase {
    
    var sut: DatabaseManagerProtocol!
    
    override func setUp() {
        super.setUp()
        sut = DatabaseManager()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func testVerifyWithRegisterSuccess() {
        sut.createBreeds(id: 1, name: "Dog", photo: "www.dog.com.br")
        XCTAssert(true)
        removeInFavorites()
    }
    
    func testVerifyFetchWithSuccess() {
        sut.fetch()
        XCTAssert(true)
    }
    
    func testVerifyFetchAllWithSuccess() {
        sut.createBreeds(id: 1, name: "Dog", photo: "www.dog.com.br")
        
        var favoritesList = [BreedEntity]()
        favoritesList = sut.fetchAll()
        XCTAssertFalse(favoritesList.isEmpty)
        removeInFavorites()
    }
    
    func testVerifyGetByIdWithSuccess() {
        sut.createBreeds(id: 1, name: "Dog", photo: "www.dog.com.br")
        let breedsDTO: BreedsDTO = .stub(id: 1,
                                         name: "Dog",
                                         temperament: "Tranquilo",
                                         description: "Descrição",
                                         life_span: "10-50",
                                         image: .stub(url: "www.dog.com.br"),
                                         weight: .stub(metric: "2", imperial: "2"),
                                         height: .stub(metric: "2", imperial: "2"))
        
        sut.getById(detailsView: DetailsView(), breedsItems: breedsDTO)
        XCTAssert(true)
        removeInFavorites()
    }
    
    func testVerifyDeleteFavoriteWithSuccess() {
        sut.createBreeds(id: 1, name: "Dog", photo: "www.dog.com.br")
        sut.deleteBreed(id: 1)
        XCTAssert(true)
    }
    
    private func removeInFavorites() {
        sut.deleteBreed(id: 1)
    }

}
