//
//  ModelData.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var rezepte: [Rezept] = load("RezeptDaten.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
/*
func write<T: Encodable>(_ filename: String, _ rezept: Rezept) -> T {

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    

    do {
        let encoder = JSONEncoder()
        return try encoder.encode(rezept) as! T
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
    do {
        data = try Data
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
}
*/
