//
//  TabBar.swift
//  LocalFood
//
//  Created by Steffen Schulz on 08.11.22.
//

import SwiftUI

struct TabBar: View {

    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State var bgColor: Color = Color(red: 255/255, green: 255/255, blue: 226/255)
    @State private var showingSheet = false
    var body: some View {
        GeometryReader { geometry in
            
            HStack{
                // Navigation zu dem Start und Rezept View
                NavigationLink(destination: ContentView() ) {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "house", tabName: "Start").foregroundColor(fontColor)
                }.buttonStyle(PlainButtonStyle())
                NavigationLink(destination: RezeptListe() ) {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "fork.knife", tabName: "Rezepte").foregroundColor(fontColor)
                }.buttonStyle(PlainButtonStyle()).onTapGesture( ){
                    UIView.setAnimationsEnabled(false)
                }
                
                // Implementierung des +-Buttons um Rezepte zu erstellen
                ZStack{
                    Button(action: {
                        // Aufruf der View um ein Rezept zu erstellen, wenn der Button gedrückt wird
                        changeAnimation()
                        showingSheet.toggle()
                    }, label: {
                        Circle().foregroundColor(barColor)
                            .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                            .shadow(radius: 4)
                            .overlay(
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(fontColor)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                            )
                    }).sheet(isPresented: $showingSheet) {
                        CreateRezeptView(newRezept: Rezept(name: "", kategorie: "", dauerMinuten: "", portionen: 4, isVegan: true, isVegetarisch: false, isFavorisiert: false, isFavorit: false, zutatenListe: [""], zutatenMenge: [""], schritte: [""], bildName: "", bildURL: URL(filePath: ""), kommentar: [""], kommentarBenutzer: [""], benutzerBild: [""]))
                    }
                }.offset(y: -geometry.size.height/3/1)
                
                
                
                // Navigation zu dem Start und Rezept View
                NavigationLink(destination: ChallengeView() ) {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "trophy", tabName: "Challanges").foregroundColor(fontColor)
                }.buttonStyle(PlainButtonStyle())
                
                NavigationLink(destination: ProfilView() ) {
                    TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "person.crop.circle", tabName: "Profil").foregroundColor(fontColor)
                }.buttonStyle(PlainButtonStyle())
            }.frame(width: geometry.size.width, height: geometry.size.height/1).shadow(radius: 2).background(barColor.edgesIgnoringSafeArea(.bottom))
                .onAppear(){
                    UIView.setAnimationsEnabled(false)
                }
        }.edgesIgnoringSafeArea(.bottom)
    }
}

func changeAnimation(){
    UIView.setAnimationsEnabled(true)
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
