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
    private let session: URLSessionProtocol

    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    @MainActor
    func getButtons() async {
        guard let url = APIEndpoints.url else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(ShapeModel.self, from: data)
            self.buttons = decodedData.buttons
        } catch {
            print("Error:", error)
        }
    }
    
    func clearAll() {
        shapes.removeAll()
    }
}
