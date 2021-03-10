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
    
    func testSignupWithSuccess() {
        let textField = app.textFields.firstMatch
        textField.tap()
        textField.typeText("joao@uol.com")
        app.buttons["Log In"].tap()
        
        let title = app.staticTexts["Breeds"]
        XCTAssertTrue(title.exists)
    }
    
    func testSignupWithEmptyField() {
        app.buttons["Log In"].tap()
        let emptyMessage = app.staticTexts["Please fill in the email field"]
        XCTAssertTrue(emptyMessage.exists)
    }
    
    func testLoadBreedsFromAPI() throws {
        signup(text: "joao@uol.com")
        
        let element = app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).firstMatch
        XCTAssertTrue(element.waitForExistence(timeout: 10))
    }
    
    func testVerifyDescriptionIsEqual() throws {
        signup(text: "joao@uol.com")
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let description = app.staticTexts["description-text"].label
        XCTAssertEqual(description, "This dog has no description")
    }
    
    func testVerifyFavoriteItem() throws {
        signup(text: "joao@uol.com")
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let buttonFavorite = app.scrollViews.otherElements.buttons["button-favorite"]
        buttonFavorite.tap()
        
        let buttonFavoritedLabel = buttonFavorite.label
        XCTAssertEqual(buttonFavoritedLabel, "♡ REMOVE TO FAVORITES")
        
        // For removed favorite
        buttonFavorite.tap()
    }
    
    private func signup(text: String) {
        let textField = app.textFields.firstMatch
        textField.tap()
        textField.typeText(text)
        app.buttons["Log In"].tap()
    }
}
