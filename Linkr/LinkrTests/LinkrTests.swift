import XCTest
@testable import Linkr

class LinkrTests: XCTestCase {

    var user: User!
    var connection: Connection!
    
    override func setUp() {
        super.setUp()
        user = User(name: "Test User", email: "testuser@gmail.com", businessDetails: "Test Business")
        connection = Connection(user1: user, user2: User(name: "Test User 2", email: "testuser2@gmail.com", businessDetails: "Test Business 2"))
    }

    override func tearDown() {
        user = nil
        connection = nil
        super.tearDown()
    }

    func testUserInitialization() {
        XCTAssertNotNil(user)
        XCTAssertEqual(user.name, "Test User")
        XCTAssertEqual(user.email, "testuser@gmail.com")
        XCTAssertEqual(user.businessDetails, "Test Business")
    }

    func testConnectionInitialization() {
        XCTAssertNotNil(connection)
        XCTAssertEqual(connection.user1, user)
        XCTAssertNotNil(connection.user2)
        XCTAssertEqual(connection.user2.name, "Test User 2")
    }
    
    func testConnectionMatch() {
        XCTAssertFalse(connection.isMatch)
        connection.user2.swipeRightOn(user: user)
        XCTAssertTrue(connection.isMatch)
    }
}