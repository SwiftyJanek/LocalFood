//
//  ModelData.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import Foundation

// Model Data, ist ein published Object das global verfügbar ist
final class ModelData: ObservableObject {
    @Published var rezepte: [Rezept] = []
    public init() {
        self.rezepte = load("RezeptDaten.json") + load("RezeptDatenUser.json")
    }
}

// Hier werden die Daten aus der Übergebenen JSON Datei geladen und ein Generic zurückgegeben, der Rückgabetyp ist also variabel
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
        //print("Data: \(data)")
        let decodedData = try decoder.decode([T].self, from: data)
        //print("Decoded Data: \(decodedData)")
        return decodedData
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error) Path: \(jsonURL.path)")
    }
}

// Hier wird ein neues Rezept Objekt in der JSON Datei die übergeben wurde gespeichert
func saveObjectAsJSON(object: Rezept, fileName: String) {
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
        
        // Decode die JSON Daten in ein Array vom Typ Rezept
        let jsonDecoder = JSONDecoder()
        var rezeptArray = try? jsonDecoder.decode([Rezept].self, from: jsonData!)
        
        // Füge dem Array ein neues Rezept hinzu
        rezeptArray?.append(object)
        
        // Encode die geänderten Daten wieder 
        let newJSONData = try? jsonEncoder.encode(rezeptArray)
        
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

