//
//  TabBar.swift
//  LocalFood
//
//  Created by Steffen Schulz on 08.11.22.
//

import SwiftUI

struct TabBar: View {

    @State private var showingSheet = false
    var body: some View {
        GeometryReader { geometry in
                HStack{
                    NavigationLink(destination: ContentView() ) {
                        TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "house", tabName: "Start")
                    }.buttonStyle(PlainButtonStyle())
                    NavigationLink(destination: RezeptListe() ) {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "fork.knife", tabName: "Rezepte")
                    }.buttonStyle(PlainButtonStyle())
                    ZStack{
                        
                     
                        
                        Button(action: {
                            showingSheet.toggle()
                           
                        }, label: {
                            Circle().foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                                .shadow(radius: 4)
                                .overlay(
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.black)
                                            .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                         
                                           
                                )
                       
                        }).sheet(isPresented: $showingSheet) {
                            CreateRezeptView(newRezept: Rezept(id: 1, name: "", kategorie: "", dauerMinuten: "", portionen: 4, isVegan: true, isVegetarisch: false, isFavorisiert: false, isFavorit: false, zutatenListe: [""], zutatenMenge: [""], schritte: [""], bildName: ""))
                        }
                        
                        
                 

                        
                 
                        
                        

                    }.offset(y: -geometry.size.height/3/1)
                    NavigationLink(destination: ChallengeView() ) {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "trophy", tabName: "Challanges")
                    }.buttonStyle(PlainButtonStyle())

                    NavigationLink(destination: ProfilView() ) {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "person.crop.circle", tabName: "Profil")
                    }.buttonStyle(PlainButtonStyle())
                }.frame(width: geometry.size.width, height: geometry.size.height/1).shadow(radius: 2).background(Color.white).edgesIgnoringSafeArea(.bottom)

        }.edgesIgnoringSafeArea(.bottom)
        }
    }


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
