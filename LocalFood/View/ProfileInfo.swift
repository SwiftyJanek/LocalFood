//
//  ProfileInfo.swift
//  LocalFood
//
//  Created by Janek Behrens on 13.12.22.
//

import SwiftUI

struct ProfileInfo: View {
    @EnvironmentObject var modelData: ModelDataChallenge
    var challenges: [Challenge] = ModelDataChallenge().challenges
    @State var progressValue: Float = 0.6
    let nextBadges = ["erstesDienstjahr", "meeresChamp", "PilzMeister", "abzeichenChamp"]
    @State var allBadges = ["winterChamp"]
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State private var showingSheet = false

    var body: some View {
        
   
        
        NavigationStack{
            List {
                // Add your profile info here, such as an image and name
                HStack{
                    Image("profilePic_Janek")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Text("Janek Behrens")
                }.listRowBackground(barColor.brightness(0.55))
                HStack{
                    Text("Level: 1")
                    ProgressBar(value: 0.5).frame(height: 20)
                    Text("2")
                }.listRowBackground(barColor.brightness(0.55))
                HStack{
                    Text("Aktueller Rang: Newcomer")
                }.listRowBackground(barColor.brightness(0.55))
                // Add a section for your profile details, such as your location and bio
                
                    Section(header: Text("Abzeichen")) {
          
                        ScrollView(.horizontal){
                            HStack {
                      
                                ForEach(challenges) { challenge in
                                    let loop = challenge.progress
                                    if loop >= 1.0{
                                        HStack{
                                            NavigationLink {
                                                ChallengeDetails(challenge: challenge)
                                            } label: {
                                                ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                    .padding(.vertical)
                                                    .frame(width: 60.0, height: 60.0)
                                            }
                                        }.listRowBackground(barColor.brightness(0.55))
                                    }
                                }
                             
                                
                                
                                
                            }.listRowBackground(barColor.brightness(0.55))
                            .background(barColor.brightness(0.55))
                            .padding(.leading)
                        }.listRowBackground(barColor.brightness(0.55))
                        
                }.background(barColor.brightness(0.55))
                    .listRowBackground(barColor.brightness(0.55))
                
                
                Section(header: Text("Nächste Abzeichen")) {

                    ScrollView(.horizontal){
                        HStack {
                  
                            ForEach(challenges) { challenge in
                                let loop = challenge.progress
                                if loop < 1.0{
                                    HStack{
                                        NavigationLink {
                                            ChallengeDetails(challenge: challenge)
                                        } label: {
                                            ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                .padding(.vertical)
                                                .frame(width: 60.0, height: 60.0)
                                        }
                                    }.listRowBackground(barColor.brightness(0.55))
                                }
                            }
                         
                            
                            
                            
                        }.listRowBackground(barColor.brightness(0.55))
                        .background(barColor.brightness(0.55))
                        .padding(.leading)
                    }.listRowBackground(barColor.brightness(0.55))
                }
                
                Section(header: Text("Mein Bereich")) {
                    HStack {
                        NavigationLink {

                        } label: {
                            Image(systemName: "heart")
                            Text("Lebensmittel")
                        }
                    }.listRowBackground(barColor.brightness(0.55))
                    HStack {
                        NavigationLink {

                        } label: {
                            Image(systemName: "person")
                            Text("Eigene Rezepte")
                        }
                    }.listRowBackground(barColor.brightness(0.55))
                    HStack {
                        NavigationLink {
                            RezeptListe(showFavoritesOnly: true)
                        } label: {
                            Image(systemName: "heart")
                            Text("Rezepte")
                        }
                    }.listRowBackground(barColor.brightness(0.55))
                    Button("+ Rezept erstellen") {
                               showingSheet.toggle()
                           }
                           .sheet(isPresented: $showingSheet) {
                               CreateRezeptView(newRezept: Rezept(name: "", kategorie: "", dauerMinuten: "", portionen: 4, isVegan: true, isVegetarisch: false, isFavorisiert: false, isFavorit: false, zutatenListe: [""], zutatenMenge: [""], schritte: [""], bildName: "", bildURL: URL(filePath: ""), kommentar: [""], kommentarBenutzer: [""], benutzerBild: [""]))
                           }.listRowBackground(barColor.brightness(0.55))
                }
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .listRowBackground(barColor.brightness(0.55))
                .background(barColor.brightness(0.55))
            
                }    .navigationBarBackButtonHidden(true)
            .navigationTitle("Profil")
            .navigationBarHidden(true)
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
