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
        guard let url = URL(string: Constnats.APIEndpoints.url) else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(ShapeModel.self, from: data)
            self.buttons = decodedData.buttons
        } catch {
            print(Constnats.Error.error, error)
        }
    }
    
    func clearAll() {
        shapes.removeAll()
    }
    
    func clearCircles() {
        shapes.removeAll { $0 == Constnats.Shapes.circle}
    }
    
    func AddCircle() {
        shapes.append(Constnats.Shapes.circle)
    }
    
    func RemoveCircle() {
        if let lastIndex = shapes.lastIndex(of: Constnats.Shapes.circle) {
            shapes.remove(at: lastIndex)
        }
    }
}
