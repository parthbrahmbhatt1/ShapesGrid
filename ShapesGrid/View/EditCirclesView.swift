//
//  EditCirclesView.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import SwiftUI

struct EditCirclesView: View {
    @ObservedObject var viewModel: ShapeViewModel
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    
    var body: some View  {
        let circles = viewModel.shapes.filter {
            $0 == "circle"
        }
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(circles.indices, id: \.self) { index in
                    ShapeViewBuilder.shapeView(for: viewModel.shapes[index])
                        .frame(width: 80, height: 80)
                        .foregroundColor(.cyan)
                }
            }
        }
    }
}
