//
//  ModelDataChallenge.swift
//  LocalFood
//
//  Created by Steffen Schulz on 16.01.23.
//

import Foundation

// ModelDataChallenge, ist ein published Object das global verfügbar ist
final class ModelDataChallenge: ObservableObject {
    @Published var challenges: [Challenge] = []
    init() {
        self.challenges = loadCha("Challenges.json")
    }
}

// Hier werden die Daten aus der Übergebenen JSON Datei geladen und ein Generic zurückgegeben, der Rückgabetyp ist also variabel
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
        let decodedData = try decoder.decode([T].self, from: data)
        return decodedData
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error) Path: \(jsonURL.path)")
    }
}



// Hier wird eine geänderte Challenge zurück in die JSON Datei gespeichert.
func saveCha(object: Challenge, fileName: String) {
    let jsonEncoder = JSONEncoder()
    let jsonURL = try? FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: false
    ).appendingPathComponent(fileName).appendingPathExtension("json")

    //Überprüfung ob die JSON-Datei existiert.
    if FileManager.default.fileExists(atPath: jsonURL!.path) {
        
        // Datei lesen
        let jsonData = try? Data(contentsOf: jsonURL!)

        // Decode die JSON Daten in ein Array vom Typ Challenge
        let jsonDecoder = JSONDecoder()
        var challengeArray = try? jsonDecoder.decode([Challenge].self, from: jsonData!)

        // Füge dem Array eine neue Challenge hinzu
        challengeArray?.append(object)

        // Encode die geänderten Daten wieder
        let newJSONData = try? jsonEncoder.encode(challengeArray)

        // Schreibe die Daten in die JSON-Datei
        try? newJSONData?.write(to: jsonURL!)
        print("JSON file saved successfully! to: \(jsonURL!)")
    } else {
        // Wenn die Datei nicht existiert, erstellte sie und speicher das Array anschließend in das File
        let newJSONData = try? jsonEncoder.encode([object])
        try? newJSONData?.write(to: jsonURL!)
        print("JSON file saved successfully! to: \(jsonURL!)")
    }
}

func deleteCha(fileName: String) {

    let jsonURL = try? FileManager.default.url(
        for: .documentDirectory,
        in: .userDomainMask,
        appropriateFor: nil,
        create: false
    ).appendingPathComponent(fileName).appendingPathExtension("json")
    
     //Überprüfung ob die JSON-Datei existiert, wenn ja dann wird sie gelöscht
    if FileManager.default.fileExists(atPath: jsonURL!.path) {
        
        do{
            try FileManager.default.removeItem(atPath: jsonURL!.path)
        }
        catch let error as NSError{
            print("Error: \(error)")
        }
    }
}
