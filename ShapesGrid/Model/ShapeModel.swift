//
//  ShapeModel.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import Foundation

struct ShapeModel: Identifiable, Codable {
    var id = UUID()
    let name: String
    let draw_path: String
}
