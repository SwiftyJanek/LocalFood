//
//  RezeptView.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI
import CoreData

// Dies ist die Rezeptanzeige, hier wird das Rezept aus allen weiteren Elementen im View zusammengebaut
struct RezeptView: View {
    @EnvironmentObject var modelData: ModelData
    var rezept: Rezept
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State var bgColor: Color = Color(red: 255/255, green: 255/255, blue: 226/255)
    @FocusState private var editorIsFocused: Bool
    
    var rezeptIndex: Int {
        modelData.rezepte.firstIndex(where: { $0.id == rezept.id })!
    }
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    let bewertung = 4
    
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    @State var kommentar: String
    @State var kommentarPlaceholder = "Schreibe einen Kommentar..."
    
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(spacing:0){
                
                HStack(spacing:0){
                }.background(Color.white).padding(.bottom, 1).frame(width: geometry.size.width , height: geometry.size.height/2000)
                
                //Linie zwischen Navigation und Inhalt
                VStack{}
                    .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                
                ScrollView{
                    /// Hier ändern
                    
                    HStack{
                        Text(rezept.name).font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                    }.padding(.top, 10)
                    
                    
                    getImageView(bildName: rezept.bildName, bildURL: rezept.bildURL)
                    
                    
                    
                    HStack{
                        Text("⏳ \(rezept.dauerMinuten)").fontWeight(.bold)
                        Text("🥣 \(rezept.portionen)").fontWeight(.bold).padding(.leading, 30)
                        if (rezept.isVegan){
                            Text("🥬 vegan").fontWeight(.bold).padding(.leading, 30)
                        }
                        if (rezept.isVegetarisch){
                            Text("🌱 vegetarisch").fontWeight(.bold).padding(.leading, 30)
                        }
                        
                    }.padding(.top, 10)
                    
                    Divider()
                    Text("Zutatenliste").font(.title2).fontWeight(.bold)
                    VStack(){
                        HStack(){
                            VStack(alignment: .trailing) {
                                ForEach(rezept.zutatenListe, id: \.self) { zutat in
                                    Text(zutat)
                                }
                            }
                            Divider()
                            VStack(alignment: .leading) {
                                ForEach(rezept.zutatenMenge, id: \.self) { zutatGewicht in
                                    Text(zutatGewicht)
                                }
                            }
                            .padding(.trailing)
                        }
                    }
                    
                    Divider()
                    
                    Text("Zubereitung").font(.title2).fontWeight(.bold)
                    
                    VStack(alignment: .center) {
                        ForEach(Array(self.rezept.schritte.enumerated()), id: \.1.self) { (index, text) in
                            Text("Schritt \(index+1)").font(.subheadline).fontWeight(.bold)
                            Text(text)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                        
                        Spacer()
                        Text("🙋🏼‍♂️ Erstellt von Janek Behrens")
                            .font(.caption)
                        Divider()
                        
                    }.padding()
                    
                    VStack{
                        HStack{
                            Text("Bewertung")
                            
                            if label.isEmpty == false {
                                Text(label)
                            }
                            
                            ForEach(1..<maximumRating + 1, id: \.self) { number in
                                image(for: number)
                                    .foregroundColor(number > rating ? offColor : onColor)
                                    .onTapGesture {
                                        rating = number
                                    }
                            }
                        }
                        
                        Button(action: {
                            self.showImagePicker.toggle()
                        }) {
                            Text("Foto teilen")
                        }
                        .sheet(isPresented: $showImagePicker) {
                            CameraOpen(showImagePicker: self.$showImagePicker)
                        }
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                        Divider()
                        
                        
                        //NavigationView {
                        Text("Kommentare").font(.title2).fontWeight(.bold)
                        VStack{
                            HStack{
                                Text("Bitte beachte die Community-Richtlinien, bevor du einen Kommentar schreibst!")
                                    .font(.caption)
                                    .padding(.top)
                            }
                        }
                        
                        ZStack {
                            if self.kommentar.isEmpty {
                                TextEditor(text:$kommentarPlaceholder)
                                    .disabled(true)
                                    .foregroundColor(Color.gray)
                                    .font(.custom("HelveticaNeue", size: 13))
                                    .lineSpacing(5)
                                    .frame(height: 120)
                                    .border(.black)
                                    .padding()
                                
                            }
                            TextEditor(text: $kommentar)
                                .opacity(self.kommentar.isEmpty ? 0.25 : 1)
                                .foregroundColor(Color.gray)
                                .font(.custom("HelveticaNeue", size: 13))
                                .lineSpacing(5)
                                .frame(height: 120)
                                .border(.black)
                                .padding()
                            
                        }.focused($editorIsFocused)
                        
                        
                        
                        Button {
                            print("Veröffentlichen")
                            kommentar = ""
                            editorIsFocused = false
                        } label: {
                            Label("Kommentar veröffentlicht", systemImage: "square.and.pencil")
                        }
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                        VStack(alignment: .leading){
                            
                            Divider()
                            
                            ForEach(Array(self.rezept.kommentar.enumerated()), id: \.1.self) { (index, kommentar) in
                                VStack{
                                    HStack{
                                        ProfileImageCircle(imageName: rezept.benutzerBild[index]).padding(5)
                                        VStack(alignment: .leading){
                                            Text(rezept.kommentarBenutzer[index])
                                                .font(.headline)
                                                .frame(alignment: .leading)
                                            Text(kommentar)
                                        }
                                    }
                                }
                            }
                            
                            VStack{
                                HStack{
                                    ProfileImageCircle(imageName: "profilePic_Janek").padding(5)
                                    VStack(alignment: .leading){
                                        Text("Janek Behrens")
                                            .font(.headline)
                                            .frame(alignment: .leading)
                                        Text("Ey diese Kommentarfunktion ist so geil, musste einfach noch son Ding reinhauen...")
                                    }
                                }
                            }
                            VStack{
                                HStack{
                                    ProfileImageCircle(imageName: "profilePic_Janek").padding(5)
                                    VStack(alignment: .leading){
                                        Text("Janek Behrens")
                                            .font(.headline)
                                            .frame(alignment: .leading)
                                        Text("Boah geht mir da einer drauf ab!!!")
                                    }
                                }
                            }
                        }.padding()
                    }
                    /// Hier Ende
                }.frame(width: geometry.size.width , height: geometry.size.height/1.083).background(bgColor)
                    .navigationTitle(rezept.name).navigationBarTitleDisplayMode(.inline)
                VStack{}
                    .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                
                TabBar()
            }.onAppear(){
                UIView.setAnimationsEnabled(true)
            }
            .background(barColor.ignoresSafeArea(edges: .top))
            
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    func getImageView(bildName: String, bildURL: URL) -> some View {
        if bildName.contains(".png") {
            //Benuterfoto
            print("- finalUrl: \(bildURL)")
            if let imageData = try? Data(contentsOf: bildURL),
               let uiImage = UIImage(data: imageData){
                let image = Image(uiImage: uiImage)
                return TitleImage(image: image)
            } else {
                print("RezeptView - Fehler, konnte das User-Bild nicht laden...")
            }
        } else if bildName.isEmpty {
            print("No Image provided")
            let image = Image("FotoHinzufuegen")
            return TitleImage(image: image)
        } else {
            //Beispielfoto
            return TitleImage(image: rezept.bild)
        }
        print("No Image provided")
        let image = Image("FotoHinzufuegen")
        return TitleImage(image: image)
    }
    
}

struct RezeptView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        RezeptView(rezept: modelData.rezepte[0], rating: .constant(4), kommentar: "")
            .environmentObject(modelData)
    }
}
