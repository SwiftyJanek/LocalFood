//
//  CreateRezeptView.swift
//  LocalFood
//
//  Created by Janek Behrens on 09.01.23.
//

import SwiftUI



struct CreateRezeptView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State var name: String = ""
    @State var kategorie: String = ""
    @State private var wakeUp = Date.now
    @State private var dauer: Double = 20
    @State private var eigenschaft = 0
    @State private var portionen: Double = 4
    @State private var image: UIImage = (UIImage(named: "FotoHinzufuegen.png") ?? UIImage())
    @State private var showSheet = false

    @FocusState private var keyboardOn: Bool
    
    @State var schritte: [SchrittText] = [SchrittText(value: "")]
    @State var zutatenListe: [SchrittText] = [SchrittText(value: "")]
    @State var zutatenMenge: [SchrittText] = [SchrittText(value: "")]

    @State var newRezept: Rezept

    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("Infos")){
                    TextField("Name", text: $name)
                    HStack{
                        Slider(value: $dauer, in: 5...120, step: 1)
                        Text("\(dauer, specifier: "%.f") Minuten")
                    }
                    Picker("", selection: $eigenschaft) {
                        Text("🥩 Mit Fleisch").tag(0)
                        Text("🧀 Vegetarisch").tag(1)
                        Text("🌱 Vegan").tag(2)
                    }
                    .pickerStyle(.segmented)
                    TextField("Kategorie", text: $kategorie)
                    HStack{
                        Slider(value: $portionen, in: 1...10, step: 1)
                        Text("\(portionen, specifier: "%.f") Portionen")
                    }
                }
                Section(header: Text("Bild hinzufügen")){
                    HStack{
                        Image(uiImage: self.image)
                            .resizable()
                            .padding(.all, 4)
                            .frame(width: 100, height: 100)
                            .background(Color.gray.opacity(0.3))
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Rectangle())
                            .padding(8)
                            .onTapGesture {
                                showSheet = true
                            }
                            .sheet(isPresented: $showSheet) {
                                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                            }
                    }
                }
                Section(header: Text("Zutaten")){
                    HStack{
                        VStack{
                            Text("Name")
                                .fontWeight(.bold)
                            Divider()
                            ForEach($zutatenListe) { $text in
                                    TextField("", text: $text.value)
                            }
                        }
                        Divider()
                        VStack{
                            Text("Menge")
                                .fontWeight(.bold)
                            Divider()
                            ForEach($zutatenMenge) { $text in
                                TextField("", text: $text.value)
                            }
                        }
                    }
                    Button {
                        zutatenMenge.append(SchrittText(value: ""))
                        zutatenListe.append(SchrittText(value: ""))
                    } label: {
                        Label("Zutat hinzufügen", systemImage: "plus.circle")
                    }
                }
                Section(header: Text("Schritte hinzufügen")){
                    ForEach($schritte) { $element in
                        TextField("Schritt", text: $element.value)
                    }

                    Button {
                        schritte.append(SchrittText(value: ""))
                    } label: {
                        Label("Schritt hinzufügen", systemImage: "plus.circle")
                    }
                }
            }
            .navigationTitle ("Rezept erstellen")
            //.listStyle(GroupedListStyle())
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Sichern") {
                            // Hier werden alle Werte in das neue Rezeptobjekt aufgenommen
                            newRezept.name = name
                            newRezept.kategorie = kategorie
                            newRezept.dauerMinuten = String(dauer)
                            newRezept.portionen = Int(portionen)
                            if eigenschaft == 2 {newRezept.isVegan = true} else { newRezept.isVegetarisch = false}
                            if eigenschaft == 1 {newRezept.isVegetarisch = true} else { newRezept.isVegan = false}
                            newRezept.isFavorisiert = false
                            newRezept.isFavorit = false
                            
                            for element in zutatenListe{
                                if element.value == "" {
                                    continue
                                } else {
                                    newRezept.zutatenListe.append(String(element.value))
                                }
                            }
                            
                            for element in zutatenMenge{
                                if element.value == "" {
                                    continue
                                } else {
                                    newRezept.zutatenMenge.append(String(element.value))
                                }
                            }
                            
                            for element in schritte{
                                if element.value == "" {
                                    continue
                                } else {
                                    newRezept.schritte.append(String(element.value))
                                }
                            }
                            
                            newRezept.bildName = image.description
                            store(image: image, forKey: image.description, withStorageType: .fileSystem)
                            
                            print("\(newRezept.name)\n\(newRezept.kategorie)\n\(newRezept.dauerMinuten)\n\(newRezept.portionen)\n\(newRezept.isVegan)\n\(newRezept.isVegetarisch)\n\(newRezept.isFavorisiert)\n\(newRezept.isFavorit)\n\(newRezept.zutatenListe.description)\n\(newRezept.zutatenMenge.description)\n\(newRezept.schritte.description)\n\(newRezept.bildName)")
                            
                            saveObjectAsJSON(object: newRezept, fileName: "RezeptDatenUser")
                            
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Abbrechen", role: .cancel) {
                            dismiss()
                        }
                    }
                }
            }
        }
    }

struct SchrittText: Identifiable {
    let id = UUID()
    var value: String
}

func didDismiss() {
    // Handle the dismissing action.
}

private func filePath(forKey key: String) -> URL? {
    let fileManager = FileManager.default
    guard let documentURL = fileManager.urls(for: .documentDirectory,
                                            in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
    
    return documentURL.appendingPathComponent(key + ".png")
}

enum StorageType {
    case userDefaults
    case fileSystem
}

private func store(image: UIImage,
                    forKey key: String,
                    withStorageType storageType: StorageType) {
    if let pngRepresentation = image.pngData() {
        switch storageType {
        case .fileSystem:
            if let filePath = filePath(forKey: key) {
                do  {
                    try pngRepresentation.write(to: filePath,
                                                options: .atomic)
                } catch let err {
                    print("Saving file resulted in error: ", err)
                }
            }
        case .userDefaults:
            UserDefaults.standard.set(pngRepresentation,
                                        forKey: key)
        }
    }
}


struct CreateRezeptView_Previews: PreviewProvider {

    static var previews: some View {
        CreateRezeptView(newRezept: Rezept(name: "", kategorie: "", dauerMinuten: "", portionen: 4, isVegan: true, isVegetarisch: false, isFavorisiert: false, isFavorit: false, zutatenListe: [""], zutatenMenge: [""], schritte: [""], bildName: ""))
    }
}
