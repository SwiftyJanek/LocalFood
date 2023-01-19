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
        //print("Data: \(data)")
        let decodedData = try decoder.decode([T].self, from: data)
        //print("Decoded Data: \(decodedData)")
        return decodedData
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error) Path: \(jsonURL.path)")
    }
}


func saveCha(object: Challenge, fileName: String) {
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
        var challengeArray = try? jsonDecoder.decode([Challenge].self, from: jsonData!)

        // Add the new object to the array
        challengeArray?.append(object)

        // Encode the modified array back to JSON data
        let newJSONData = try? jsonEncoder.encode(challengeArray)

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

func deleteCha(fileName: String) {

    // Get the URL for the JSON file
    let jsonURL = try? FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: false
    ).appendingPathComponent(fileName).appendingPathExtension("json")
    
    
    
    // Check if the file exists
    if FileManager.default.fileExists(atPath: jsonURL!.path) {
        
        do{
            
            try FileManager.default.removeItem(atPath: jsonURL!.path)
        }
        
        catch let error as NSError{
            print("Error: \(error)")
            
        }
    }
}
