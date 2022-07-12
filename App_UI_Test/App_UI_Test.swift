//
//  App_UI_Test.swift
//  App_UI_Test
//
//  Created by lera on 11.07.2022.
//

import XCTest

class App_UI_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        sleep(1)
        snapshot("Lera_MainScreen")
        let myTable = app.tables.matching(identifier: "myUniqueTableViewIdentifier")
        let cell = myTable.cells.element(matching: .cell, identifier: "myCell_0")
        cell.tap()
        sleep(1)
        snapshot("Lera_DetailsScreen")

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
