//
//  ShapeViewModel.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import Foundation

class ShapeViewModel: ObservableObject {
    @Published var buttons: [ShapeButton] = []
    @Published var shapes: [String] = []
    
    func getButtons() async {
        guard let url = URL(string: "http://staticcontent.cricut.com/static/test/shapes_001.json") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ShapeModel.self, from: data)
            DispatchQueue.main.async {
                self.buttons = decoded.buttons
            }
        } catch {
            print("Error:", error)
        }
    }
    
    func addButton(_ shape: String) {
        shapes.append(shape)
    }
    
    func clear() {
        shapes.removeAll()
    }
}
