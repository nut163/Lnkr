import XCTest
@testable import Linkr

class LinkrUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testLoginScreen() throws {
        let app = XCUIApplication()
        XCTAssertTrue(app.buttons["Login"].exists)
        XCTAssertTrue(app.buttons["Signup"].exists)
    }

    func testSignupScreen() throws {
        let app = XCUIApplication()
        app.buttons["Signup"].tap()
        XCTAssertTrue(app.textFields["Email"].exists)
        XCTAssertTrue(app.secureTextFields["Password"].exists)
        XCTAssertTrue(app.buttons["Signup"].exists)
    }

    func testProfileSettingsScreen() throws {
        let app = XCUIApplication()
        app.buttons["Profile Settings"].tap()
        XCTAssertTrue(app.textFields["Business Details"].exists)
    }

    func testMatchmakingScreen() throws {
        let app = XCUIApplication()
        app.buttons["Matchmaking"].tap()
        XCTAssertTrue(app.buttons["Swipe Right"].exists)
        XCTAssertTrue(app.buttons["Swipe Left"].exists)
    }

    func testConnectionsScreen() throws {
        let app = XCUIApplication()
        app.buttons["My Connections"].tap()
        XCTAssertTrue(app.tables["Connections"].exists)
    }
}