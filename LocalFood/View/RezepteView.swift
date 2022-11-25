//
//  RezepteView.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI
import CoreData


struct RezepteView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let zutaten = ["Zwiebeln", "Parmesan", "Tomatensoße"]
    let zutatenMenge = [ "1 Stück", "50g", "500g"]
    let rezeptSchritte = 3
    var schrittText = ["Die Zwiebel und die Tomaten in Würfel schneiden, (Dosentomaten abgießen), Knoblauch und Ingwer sehr fein hacken.", "In einer hohen Pfanne das Kokosöl erhitzen, Zwiebel, Knoblauch und Ingwer hineingeben und glasig dünsten. Spinat, Tomaten und Kokosmilch (inkl. dem Wasser) hineingeben, würzen, einmal gut umrühren und zudecken.", "Alles bei schwacher Hitze, leicht blubbernd ca. 10 Min köcheln lassen. Zum Schluss die Kichererbsen dazugeben, verrühren und kurz ziehen lassen. Eventuell nochmal abschmecken und mit Chiliflocken bestreut servieren."]
    
    let bewertung = 4
    
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    @State private var kommentar = "verfasse einen Kommentar..."

    
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing:0){
                
                ScrollView{
                /// Hier ändern
                    
                    HStack{
                        Text("Rezept").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                    }.padding(.top, 10)
                    
                    TitleImage()
                    HStack{
                        Text("⏳ 30min").fontWeight(.bold)
                        Text("🥣 2").fontWeight(.bold).padding(.leading, 30)
                        Text("🥬 vegan").fontWeight(.bold).padding(.leading, 30)
                    }.padding(.top, 10)
                    
                    Divider()
                        Text("Zutatenliste").font(.title2).fontWeight(.bold)
                    VStack(){
                        HStack(){
                            VStack(alignment: .trailing) {
                                ForEach(zutaten, id: \.self) { zutat in
                                    Text(zutat)
                                }
                            }
                            Divider()
                            VStack(alignment: .leading) {
                                ForEach(zutatenMenge, id: \.self) { zutatGewicht in
                                    Text(zutatGewicht)
                                }
                            }
                        }
                    }
                    
                    Divider()
                    
                    Text("Zubereitung").font(.title2).fontWeight(.bold)

                    VStack(alignment: .center) {
                        ForEach(schrittText, id: \.self) { text in
                            Text("Schritt ").font(.subheadline).fontWeight(.bold)
                            Text(text)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                            Spacer()
                        }
                    
                    Spacer()
                    Text("Erstellt von 👤 Benutzer123")
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
                        
                        Button {
                            print("Foto teilen")
                        } label: {
                            Label("Foto teilen", systemImage: "camera")
                        }
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                        Divider()
                        
                        Text("Kommentare").font(.title2).fontWeight(.bold)
                        
                        NavigationView {
                                    TextEditor(text: $kommentar)
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal)
                                    
                        }.frame(height: 100.0).scaledToFit()
                        
                        Button {
                            print("Veröffentlichen")
                        } label: {
                            Label("Kommentar veröffentlicht", systemImage: "square.and.pencil")
                        }
                        .padding()
                        .frame(maxWidth: 300)
                        .background(Color(red: 0, green: 0.5, blue: 0.5))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        
                        VStack(alignment: .leading){
                            VStack{
                                HStack{
                                    ProfileImageCircle().padding(5)
                                    VStack(alignment: .leading){
                                        Text("Janek Behrens")
                                            .font(.headline)
                                        
                                        
                                        Text("Ein echt tolles Rezept, ich habe es mit Oma zusammen gebacken! 😋🤤")
                                    }
                                }
                                .padding(.top, 25.0)
                            }
                            VStack{
                                HStack{
                                    ProfileImageCircle().padding(5)
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
                                    ProfileImageCircle().padding(5)
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
                    
                    
                }.frame(width: geometry.size.width , height: geometry.size.height/1.07).border(Color.gray).background(Color.white)
                
                TabBar()
                
                
            }
            
        }
        
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
    
}

struct RezepteView_Previews: PreviewProvider {
    static var previews: some View {
        RezepteView(rating: .constant(4))
    }
}
