//
//  ProfileInfo.swift
//  LocalFood
//
//  Created by Janek Behrens on 13.12.22.
//

import SwiftUI

struct ProfileInfo: View {
    @State var progressValue: Float = 0.6
    let nextBadges = ["abzeichen", "rakete", "abzeichen", "rakete"]
    let progress = [0.5,0.2,0.7,0.3]
    
    //TEST
    @State private var showingSheet = false

    
    var body: some View {
        NavigationStack{
            List {
                // Add your profile info here, such as an image and name
                HStack{
                    Image("profilePic")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Text("Janek Behrens")
                }
                HStack{
                    Text("Level: 1")
                    ProgressBar(value: $progressValue).frame(height: 20)
                    Text("2")
                }
                Text("Aktueller Rang: Newcomer")
                // Add a section for your profile details, such as your location and bio
                Section(header: Text("Abzeichen")) {
                    
                    BadgeGrid(badges: ["abzeichen", "tier", "wolf", "rakete", "rakete"])
                }
                Section(header: Text("Nächste Abzeichen")) {

                    ScrollView(.horizontal){
                        HStack {
                            ForEach(self.nextBadges, id: \.self) { badge in
                                ProgressCircularBar(progress: self.$progressValue, imageName: badge)
                                    .padding(.vertical)
                                    .frame(width: 57.0, height: 57.0)
                            }
                        }
                        .padding(.leading)
                    }
                }
                
                Section(header: Text("Mein Bereich")) {
                    HStack {
                        NavigationLink {

                        } label: {
                            Image(systemName: "heart")
                            Text("Lebensmittel")
                        }
                    }
                    HStack {
                        NavigationLink {

                        } label: {
                            Image(systemName: "person")
                            Text("Eigene Rezepte")
                        }
                    }
                    HStack {
                        NavigationLink {
                            RezeptListe()
                        } label: {
                            Image(systemName: "heart")
                            Text("Rezepte")
                        }
                    }
                    Button("+ Rezept erstellen") {
                               showingSheet.toggle()
                           }
                           .sheet(isPresented: $showingSheet) {
                               CreateRezeptView(newRezept: Rezept(id: 1, name: "", kategorie: "", dauerMinuten: "", portionen: 4, isVegan: true, isVegetarisch: false, isFavorisiert: false, isFavorit: false, zutatenListe: [""], zutatenMenge: [""], schritte: [""], bildName: ""))
                           }
                }
            }
        }
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
            }.cornerRadius(45.0)
        }
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo()
    }
}
