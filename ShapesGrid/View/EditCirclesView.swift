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
            $0 == Constnats.Shapes.circle
        }
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(circles.indices, id: \.self) { _ in
                    ShapeViewBuilder.shapeView(for: Constnats.Shapes.circle)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.cyan)
                }
            }
            .padding()
        }
        
        Spacer()
        
        HStack {
            Button(Constnats.Buttons.deleteAll) {
                viewModel.clearCircles()
            }
            .frame(maxWidth: .infinity)
            
            Button(Constnats.Buttons.add) {
                viewModel.AddCircle()
            }
            .frame(maxWidth: .infinity)
            
            Button(Constnats.Buttons.remove) {
                viewModel.RemoveCircle()
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
