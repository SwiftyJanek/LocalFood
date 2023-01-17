//
//  ModelDataChallenge.swift
//  LocalFood
//
//  Created by Steffen Schulz on 16.01.23.
//

import Foundation

final class ModelDataChallenge: ObservableObject {
    @Published var challenges: [Challenge] = []
    init() {
        self.challenges = loadCha("Challenges.json")
    }
}


func loadCha<T: Decodable>(_ filename: String) -> [T] {
    let data: Data
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let jsonURL = documentsDirectory.appendingPathComponent(filename)
    if FileManager.default.fileExists(atPath: jsonURL.path) {
        do {
            data = try Data(contentsOf: jsonURL)
        } catch {
            fatalError("Couldn't load \(filename) from documents directory:\n\(error)")
        }
    } else {
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
            else {
            print("Couldn't find \(filename) in main bundle.")
            return []
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
    }
    do {
        let decoder = JSONDecoder()
        print("Data: \(data)")
        let decodedData = try decoder.decode([T].self, from: data)
        print("Decoded Data: \(decodedData)")
        return decodedData
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error) Path: \(jsonURL.path)")
    }
}
