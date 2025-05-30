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
        mockSession = nil
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
        XCTAssertEqual(viewModel.buttons[0].name, Constnats.Shapes.Circle)
        XCTAssertEqual(viewModel.buttons[0].draw_path, Constnats.Shapes.circle)
        XCTAssertEqual(viewModel.buttons[1].name, Constnats.Shapes.Square)
        XCTAssertEqual(viewModel.buttons[1].draw_path, Constnats.Shapes.square)
        XCTAssertEqual(viewModel.buttons[2].name, Constnats.Shapes.Triangle)
        XCTAssertEqual(viewModel.buttons[2].draw_path, Constnats.Shapes.triangle)
    }
    
    func testClearAll() {
        viewModel.shapes = [Constnats.Shapes.circle, Constnats.Shapes.square, Constnats.Shapes.triangle]
        XCTAssertFalse(viewModel.shapes.isEmpty)
        viewModel.clearAll()
        XCTAssertTrue(viewModel.shapes.isEmpty)
    }
    
    func testClearCircles() {
        viewModel.shapes = [Constnats.Shapes.circle, Constnats.Shapes.square, Constnats.Shapes.triangle, Constnats.Shapes.circle, Constnats.Shapes.square, Constnats.Shapes.triangle]
        viewModel.clearCircles()
        XCTAssertEqual(viewModel.shapes, [Constnats.Shapes.square, Constnats.Shapes.triangle, Constnats.Shapes.square, Constnats.Shapes.triangle])
    }
    
    func testAddCircle() {
        viewModel.AddCircle()
        XCTAssertEqual(viewModel.shapes.last, Constnats.Shapes.circle)
    }
    
    func testRemoveCircle() {
        viewModel.shapes = [Constnats.Shapes.circle, Constnats.Shapes.square, Constnats.Shapes.triangle, Constnats.Shapes.circle, Constnats.Shapes.square, Constnats.Shapes.triangle]
        viewModel.RemoveCircle()
        XCTAssertEqual(viewModel.shapes, [Constnats.Shapes.circle, Constnats.Shapes.square, Constnats.Shapes.triangle, Constnats.Shapes.square, Constnats.Shapes.triangle])
    }
}
