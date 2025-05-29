//
//  ShapeViewBuilder.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import SwiftUI

struct ShapeViewBuilder {
    @ViewBuilder
    static func shapeView(for shapeType: String) -> some View {
        switch shapeType {
        case "circle":
            Circle()
        case "square":
            Rectangle()
        case "triangle":
            Triangle()
        default:
            EmptyView()
        }
    }
}
