//
//  HomeView.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ShapeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                // Grid View
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 20))]) {
                    ForEach(viewModel.shapes, id: \.self) {
                        shapeView(for: $0)
                            .frame(width: 60, height: 60)
                    }
                }
                .padding()
                
                // Dynamic Buttons based on draw_path
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.buttons) { button in
                            Button(button.name) {
                                viewModel.addButton(button.draw_path)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
                .task {
                    await viewModel.getButtons()
                }
            }
        }
    }
    
    @ViewBuilder
    func shapeView(for shapeType: String) -> some View {
        switch shapeType {
        case "circle":
            Circle()
        case "Sqaure":
            Rectangle()
        case "Triangle":
            Triangle()
        default:
            EmptyView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
