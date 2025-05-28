//
//  ShapeViewModel.swift
//  ShapesGrid
//
//  Created by Parth Brahmbhatt on 5/28/25.
//

import Foundation

class ShapeViewModel: ObservableObject {
    @Published var buttons: [ShapeModel] = []
    @Published var shapes: [String] = []
    
    func getButtons() async {
        guard let url = URL(string: "http://staticcontent.cricut.com/static/test/shapes_001.json") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            buttons = try JSONDecoder().decode([ShapeModel].self, from: data)
        } catch {
            print("Error:", error)
        }
    }
}
