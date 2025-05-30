//
//  HomeView.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ShapeViewModel()
    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 20), count: 3)
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // Grid View
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.shapes.indices, id: \.self) { index in
                            ShapeViewBuilder.shapeView(for: viewModel.shapes[index])
                                .frame(width: 80, height: 80)
                                .foregroundColor(.cyan)
                        }
                    }
                    .padding()
                }
                
                Spacer()
                
                // Dynamic Buttons from API
                HStack {
                    ForEach(viewModel.buttons) { button in
                        Button(button.name) {
                            viewModel.shapes.append(button.draw_path)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .foregroundColor(.blue)
                    }
                }
                .padding(.bottom, 10)
            }
            
            // Static Buttons
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(Constnats.Buttons.clearAll) {
                        viewModel.clearAll()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(Constnats.Navigation.editCircles) {
                        EditCirclesView(viewModel: viewModel)
                    }
                }
            }
        }
        .task {
            await viewModel.getButtons()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
