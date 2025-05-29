//
//  ShapeViewModelTests.swift
//  ShapesGridTests
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import XCTest
@testable import ShapesGrid

final class ShapeViewModelTests: XCTestCase {
    var viewModel: ShapeViewModel!
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        viewModel = ShapeViewModel(session: mockSession)
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testGetButtons() async {
        let json = """
                {
                    "buttons": [
                        { "name": "Circle", "draw_path": "circle" },
                        { "name": "Square", "draw_path": "square" },
                        { "name": "Triangle", "draw_path": "triangle" }
                    ]
                }
                """.data(using: .utf8)!
        mockSession.testData = json
        await viewModel.getButtons()
        XCTAssertEqual(viewModel.buttons.count, 3)
        XCTAssertEqual(viewModel.buttons[0].name, "Circle")
        XCTAssertEqual(viewModel.buttons[0].draw_path, "circle")
        XCTAssertEqual(viewModel.buttons[1].name, "Square")
        XCTAssertEqual(viewModel.buttons[1].draw_path, "square")
        XCTAssertEqual(viewModel.buttons[2].name, "Triangle")
        XCTAssertEqual(viewModel.buttons[2].draw_path, "triangle")
    }
    
    func testClearAll() {
        viewModel.shapes = ["circle", "square", "triangle"]
        XCTAssertFalse(viewModel.shapes.isEmpty)
        viewModel.clearAll()
        XCTAssertTrue(viewModel.shapes.isEmpty)
    }
}
