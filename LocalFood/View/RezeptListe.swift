//
//  RezeptListe.swift
//  LocalFood
//
//  Created by Janek Behrens on 26.11.22.
//

import SwiftUI

struct RezeptListe: View {
    @EnvironmentObject var modelData: ModelData
    @State var showFavoritesOnly = false
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    
    var filteredRezepte: [Rezept] {
        modelData.rezepte.filter { rezept in
            (!showFavoritesOnly || rezept.isFavorit)
        }
    }

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack(spacing: 0){
                    
                    HStack{
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Rezepte").font(.title2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(fontColor)
                    }.background(barColor.brightness(0.15)).padding(.bottom)
                    //HEADER
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)

                
                    
                    
                    
                    ScrollView{
                        NavigationView {
                            List {
                                Toggle(isOn: $showFavoritesOnly) {
                                    Text("Nur Favoriten anzeigen")
                                }
                                
                                ForEach(filteredRezepte) { rezept in
                                    NavigationLink {
                                        RezeptView(rezept: rezept, rating: .constant(4))
                                    } label: {
                                        RezeptRow(rezept: rezept)
                                    }
                                }
                            }
                            .onAppear{self.modelData.rezepte = load("RezeptDaten.json") + load("RezeptDatenUser.json")}
                            .navigationTitle("Rezeptliste")
                         
                        
                            
                        }.frame(height: geometry.size.height/1.22)
                    }.frame(width: geometry.size.width , height: geometry.size.height/1.22)
                    
                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                    
                    TabBar()
                }.background(barColor.brightness(0.15).ignoresSafeArea(edges: .top))
                
            }.navigationBarBackButtonHidden(true).navigationTitle("Rezepte").navigationBarHidden(true).background(barColor.brightness(0.15))
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct RezeptListe_Previews: PreviewProvider {
    static var previews: some View {
        RezeptListe()
            .environmentObject(ModelData())
    }
}
