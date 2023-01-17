//
//  ProfileInfo.swift
//  LocalFood
//
//  Created by Janek Behrens on 13.12.22.
//

import SwiftUI

struct ProfileInfo: View {
    @State var progressValue: Float = 0.6
    let nextBadges = ["erstesDienstjahr", "meeresChamp", "PilzMeister", "abzeichenChamp"]
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
                    ProgressBar(value: 0.5).frame(height: 20)
                    Text("2")
                }
                Text("Aktueller Rang: Newcomer")
                // Add a section for your profile details, such as your location and bio
                Section(header: Text("Abzeichen")) {
                    
                    BadgeGrid(badges: ["pilzChamp", "sommerChamp", "winterChamp", "ersteChallengeGeschafft"])
                }
                Section(header: Text("Nächste Abzeichen")) {

                    ScrollView(.horizontal){
                        HStack {
                            ForEach(Array(self.nextBadges.enumerated()), id: \.offset) { (index, badge) in
                                ProgressCircularBar(progress: progressValue, imageName: badge)
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
                            RezeptListe(showFavoritesOnly: true)
                        } label: {
                            Image(systemName: "heart")
                            Text("Rezepte")
                        }
                    }
                    Button("+ Rezept erstellen") {
                               showingSheet.toggle()
                           }
                           .sheet(isPresented: $showingSheet) {
                               CreateRezeptView(newRezept: Rezept(name: "", kategorie: "", dauerMinuten: "", portionen: 4, isVegan: true, isVegetarisch: false, isFavorisiert: false, isFavorit: false, zutatenListe: [""], zutatenMenge: [""], schritte: [""], bildName: "", bildURL: URL(filePath: ""), kommentar: [""], kommentarBenutzer: [""], benutzerBild: [""]))
                           }
                }
            }
        }
    }
}

struct ProgressBar: View {
    @State var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemGreen))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemGreen))
            }.cornerRadius(45.0)
        }
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo()
    }
}
