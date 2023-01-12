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
                    HStack{
                        Slider(value: $portionen, in: 1...10, step: 1)
                        //Slider(value: .convert(from: $portionen), in: 1...10, step: 1)
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
                            newRezept.name = name
                            //newRezept.kategorie
                            newRezept.dauerMinuten = String(dauer)
                            newRezept.portionen = Int(portionen)
                            if eigenschaft == 2 {newRezept.isVegan = true} else { newRezept.isVegetarisch = false}
                            if eigenschaft == 1 {newRezept.isVegetarisch = true} else { newRezept.isVegan = false}
                            newRezept.isFavorisiert = false
                            newRezept.isFavorit = false
                            
                            
                            
                            
                            
                             //= zutatenListe
                            //newRezept.zutatenMenge = zutatenMenge
                            
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


struct CreateRezeptView_Previews: PreviewProvider {

    static var previews: some View {
        CreateRezeptView(newRezept: Rezept(id: 1, name: "", kategorie: "", dauerMinuten: "", portionen: 4, isVegan: true, isVegetarisch: false, isFavorisiert: false, isFavorit: false, zutatenListe: [""], zutatenMenge: [""], schritte: [""], bildName: ""))
    }
}
