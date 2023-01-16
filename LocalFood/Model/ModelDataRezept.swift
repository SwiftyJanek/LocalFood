//
//  ModelData.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var rezepte: [Rezept] = []
    public init() {
        self.rezepte = load("RezeptDaten.json") + load("RezeptDatenUser.json")
    }
}

func load<T: Decodable>(_ filename: String) -> [T] {
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


func saveObjectAsJSON(object: Rezept, fileName: String) {
    let jsonEncoder = JSONEncoder()

    // Get the URL for the JSON file
    let jsonURL = try? FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: false
    ).appendingPathComponent(fileName).appendingPathExtension("json")

    // Check if the file exists
    if FileManager.default.fileExists(atPath: jsonURL!.path) {
        // Read the existing JSON data
        let jsonData = try? Data(contentsOf: jsonURL!)

        // Decode the JSON data into an array of Rezept objects
        let jsonDecoder = JSONDecoder()
        var rezeptArray = try? jsonDecoder.decode([Rezept].self, from: jsonData!)

        // Add the new object to the array
        rezeptArray?.append(object)

        // Encode the modified array back to JSON data
        let newJSONData = try? jsonEncoder.encode(rezeptArray)

        // Write the new JSON data to the file
        try? newJSONData?.write(to: jsonURL!)
        print("JSON file saved successfully! to: \(jsonURL!)")
    } else {
        // If the file does not exist, simply create a new array with the new object and save it
        let newJSONData = try? jsonEncoder.encode([object])
        try? newJSONData?.write(to: jsonURL!)
        print("JSON file saved successfully! to: \(jsonURL!)")
    }
}

