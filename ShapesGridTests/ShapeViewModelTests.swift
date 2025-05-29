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
    
    override func setUp() {
        super.setUp()
        viewModel = ShapeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testGetButtons() throws {
        let json = """
                {
                    "buttons": [
                        { "name": "Circle", "draw_path": "circle" },
                        { "name": "Square", "draw_path": "square" },
                        { "name": "Triangle", "draw_path": "triangle" }
                    ]
                }
                """.data(using: .utf8)!
        let decodedData = try JSONDecoder().decode(ShapeModel.self, from: json)
        XCTAssertEqual(decodedData.buttons.count, 3)
        XCTAssertEqual(decodedData.buttons[0].name, "Circle")
        XCTAssertEqual(decodedData.buttons[1].name, "Square")
        XCTAssertEqual(decodedData.buttons[2].name, "Triangle")
    }
    
    func testClearAll() {
        viewModel.shapes = ["circle", "square", "triangle"]
        XCTAssertFalse(viewModel.shapes.isEmpty)
        viewModel.clearAll()
        XCTAssertTrue(viewModel.shapes.isEmpty)
    }
}
