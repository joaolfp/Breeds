import XCTest

class BreedsUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }

    func testLoadBreedsFromAPI() throws {
        let element = app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).firstMatch
        XCTAssertTrue(element.waitForExistence(timeout: 10))
    }
    
    func testVerifyDescriptionIsEqual() throws {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let description = app.staticTexts["description-text"].label
        XCTAssertEqual(description, "This dog has no description")
    }
    
    func testVerifyFavoriteItem() throws {
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let buttonFavorite = app.scrollViews.otherElements.buttons["button-favorite"]
        buttonFavorite.tap()
        
        let buttonFavoritedLabel = buttonFavorite.label
        XCTAssertEqual(buttonFavoritedLabel, "♡ REMOVE TO FAVORITES")
        
        // For removed favorite
        buttonFavorite.tap()
    }
}
