//
//  ShapeModel.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import Foundation

struct ShapeModel: Decodable {
    let buttons: [ShapeButton]
}

struct ShapeButton: Decodable, Identifiable {
    var id: String { name + draw_path }
    let name: String
    let draw_path: String
}
