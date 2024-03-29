//
//  RezeptListe.swift
//  LocalFood
//
//  Created by Janek Behrens on 26.11.22.
//

import SwiftUI

// Die Rezeptliste listet alle aus der JSON geladenen Objekte auf.
struct RezeptListe: View {
    @EnvironmentObject var modelData: ModelData
    @State var showFavoritesOnly = false
    @State var searchText = ""
    @State var selectedCategory = "Alles"
    let categories = ["Alles", "Vorspeise", "Hauptgang", "Dessert", "Vegan", "Veggie"]
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State var bgColor: Color = Color(red: 255/255, green: 255/255, blue: 226/255)
    
    var feedbackGenerator = UINotificationFeedbackGenerator()
    
    var filteredRezepte: [Rezept] {
        modelData.rezepte.filter { rezept in
            (!showFavoritesOnly || rezept.isFavorit) && (searchText.isEmpty || rezept.name.contains(searchText)) && (selectedCategory == "Alles" || rezept.kategorie == selectedCategory)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack(spacing: 0){
                    
                    HStack{
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Rezepte").font(.title2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(fontColor)
                    }.padding(.bottom).background(barColor.ignoresSafeArea(edges: .top))
                    //HEADER
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                    
                    ScrollView{
                        VStack{
                            NavigationView {
                                List {
                                    ScrollView{
                                        // Buttons mit den 6 Kategorien
                                        GridStack(rows: 2, columns: 3) { row, col in
                                            Button(action: {
                                                selectedCategory = self.categories[row * 3 + col]
                                                feedbackGenerator.notificationOccurred(.success)
                                                print("------")
                                                print("\(selectedCategory)")
                                            }) {
                                                VStack {
                                                    Image(self.categories[row * 3 + col])
                                                        .resizable()
                                                    
                                                    Text(self.categories[row * 3 + col])
                                                        .font(.callout)
                                                }
                                            }
                                            .foregroundColor(.black)
                                            .frame(width: 82, height: 80)
                                            .padding(15)
                                            .background(self.selectedCategory == self.categories[row * 3 + col] ? Color(red: 60/255, green: 143/255, blue: 43/255) : Color(red: 164/255, green: 214/255, blue: 154/255))
                                            .cornerRadius(25)
                                            
                                        }.padding(.vertical)
                                    }
                                    .listRowBackground(bgColor)
                                    
                                    // Suchfeld
                                    HStack {
                                        TextField("🔎 Rezept suchen...", text: $searchText)
                                            .padding(.leading, 10)
                                        
                                        Button(action: {
                                            self.searchText = ""
                                        }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .opacity(searchText == "" ? 0 : 1)
                                        }
                                    }
                                    .listRowBackground(bgColor)
                                    // Nur Favoriten anzeigen
                                    Toggle(isOn: $showFavoritesOnly) {
                                        Text("Nur Favoriten anzeigen")
                                    }
                                    .listRowBackground(bgColor)
                                    //Rezeptanzeige als Liste
                                    ForEach(filteredRezepte) { rezept in
                                        NavigationLink {
                                            RezeptView(rezept: rezept, rating: .constant(4), kommentar: "")
                                            
                                        } label: {
                                            RezeptRow(rezept: rezept)
                                        }
                                        .listRowBackground(bgColor)
                                        .onAppear(){
                                            UIView.setAnimationsEnabled(true)
                                        }
                                    }
                                }
                                .listStyle(.plain)
                                .onAppear{self.modelData.rezepte = load("RezeptDaten.json") + load("RezeptDatenUser.json")}
                                .background(bgColor)
                                //.preferredColorScheme()
                                .listRowBackground(bgColor)
                            }
                            .frame(height: geometry.size.height/1.22)
                            
                        }.frame(maxHeight: .infinity)
                    }.frame(width: geometry.size.width , height: geometry.size.height/1.22).background(bgColor)
                    
                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                    TabBar()
                }
                .background(barColor
                    .ignoresSafeArea(edges: .top))
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Rezepte")
            .navigationBarHidden(true)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    struct GridStack<Content: View> : View {
        let rows: Int
        let columns: Int
        let content: (Int, Int) -> Content
        
        var body: some View {
            VStack {
                ForEach(0..<rows, id: \.self) { row in
                    HStack {
                        ForEach(0..<self.columns, id: \.self) { column in
                            self.content(row, column)
                        }
                    }
                }
            }
        }
    }
}
struct RezeptListe_Previews: PreviewProvider {
    static var previews: some View {
        RezeptListe()
            .environmentObject(ModelData())
    }
}
