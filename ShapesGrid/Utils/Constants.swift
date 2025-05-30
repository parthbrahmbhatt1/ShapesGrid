//
//  Constants.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/29/25.
//

import Foundation
import SwiftUI

struct Constnats {
    struct APIEndpoints {
        static let url = "http://staticcontent.cricut.com/static/test/shapes_001.json"
    }
    
    struct Buttons {
        static let clearAll = "Clear All"
        static let deleteAll = "Delete All"
        static let add = "Add"
        static let remove = "Remove"
    }
    
    struct Colors {
        static let color = UIColor.cyan
    }
    
    struct Error {
        static let error = "Error:"
    }
    
    struct Navigation {
        static let editCircles = "Edit Circles"
    }
    
    struct Shapes {
        static let circle = "circle"
        static let square = "square"
        static let triangle = "triangle"
        static let Circle = "Circle"
        static let Square = "Square"
        static let Triangle = "Triangle"
    }
}
