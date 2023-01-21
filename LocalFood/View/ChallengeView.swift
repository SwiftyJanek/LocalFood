//
//  ChallengeView.swift
//  LocalFood
//
//  Created by Steffen Schulz on 09.11.22.
//


import SwiftUI


struct ChallengeView: View {
    @EnvironmentObject var modelData: ModelDataChallenge
    @State var showFavoritesOnly = false
    // Die Variable challenges enthält alle aus der JSON-Datei geladenen Challenges (Array)
    var challenges: [Challenge] = ModelDataChallenge().challenges
    @State var progressValue: Float = 0.6
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State var bgColor: Color = Color(red: 255/255, green: 255/255, blue: 226/255)
    
    var body: some View {
        
        GeometryReader { geometry in
            NavigationStack {
                VStack(spacing: 0){
                    
                    //HEADER mit Logo und "Challenges"
                    HStack{
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Challenges").font(.title2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(fontColor)
                    }.background(barColor).padding(.bottom)
                 
                    // Linie zwischen Header und Content der Seite
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                    
                    // Cntent der Seite
                    ScrollView{
                        VStack(spacing: 0){
                            List{
                                
                                // In dieser Sektion wird die zuletzt Besuchte Challenge angezeigt. Um diese zu ermitteln, wird das Array mit den Challenges per for-Schleife durchlaufen
                                Section(header: Text("In Bearbeitung").foregroundColor(fontColor)){
                                    ForEach(challenges) { chall in
                                        let loop = chall.finished
                                        if loop == true {
                                            HStack{
                                                NavigationLink {
                                                    ChallengeDetails(challenge: chall)
                                                } label: {
                                                    ProgressCircularBar(progress: chall.progress, imageName: chall.badge)
                                                        .padding(.vertical)
                                                        .frame(width: 60.0, height: 60.0)
                                                    Text(chall.name).foregroundColor(fontColor)
                                                    Text(" ")
                                                    ProgressBar(value: chall.progress).frame(height: 15)
                                                    Text(" ")
                                                }
                                            }.listRowBackground(bgColor)
                                        }
                                    }
                                }
                                
                                //Imageslider mit den Verlinkungen zu den einzelnen Challeges
                                HStack{
                                    let images = ["StartseiteChallenge1","StartseiteChallenge2"]
                                    ImageSlider(images: images)
                                        .frame(height: 220)
                                        .shadow(radius: 10)
                                    
                                }.listRowBackground(bgColor)
                                
                                // Sektion für alle Challenges mit der Kategorie "Draußen in der Natur". (das Array wird wieder mittels forEach-Schleife durchlaufen um alle passenden Challenges zu finden.
                                Section(header: Text("Draußen in der Natur").foregroundColor(fontColor)) {
                                    ForEach(challenges) { challenge in
                                        let loop = challenge.kategorie
                                        if loop == "Draußen in der Natur" {
                                            HStack{
                                                // Hier wird für jede Challenge der Navogationslink zur passenden Ansicht (ChallengeDetails) erstellt.
                                                NavigationLink {
                                                    ChallengeDetails(challenge: challenge)
                                                } label: {
                                                    ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                        .padding(.vertical)
                                                        .frame(width: 60.0, height: 60.0)
                                                    Text(challenge.name).foregroundColor(fontColor)
                                                    Text("\t")
                                                    
                                                    // IF-ELSE Block um die zur Schwierigkeit der Challenge passende Darstellung anzuzeigen.
                                                    if (challenge.schwierigkeit == 1){
                                                        Text("🌱")
                                                        Text("🌱").opacity(0.4)
                                                        Text("🌱").opacity(0.4)
                                                    }else if (challenge.schwierigkeit == 2){
                                                        Text("🌱")
                                                        Text("🌱")
                                                        Text("🌱").opacity(0.4)
                                                    }else{
                                                        Text("🌱")
                                                        Text("🌱")
                                                        Text("🌱")
                                                    }
                                                }
                                            }.listRowBackground(bgColor)
                                        }
                                    }
                                }
                                
                                // Sektion für alle Challenges mit der Kategorie "Beim Einkaufen". (das Array wird wieder mittels forEach-Schleife durchlaufen um alle passenden Challenges zu finden.
                                Section(header: Text("Beim Einkaufen").foregroundColor(fontColor)) {
                                    ForEach(challenges) { challenge in
                                        let loop = challenge.kategorie
                                        if loop == "Beim Einkaufen" {
                                            HStack{
                                                // Hier wird für jede Challenge der Navogationslink zur passenden Ansicht (ChallengeDetails) erstellt.
                                                NavigationLink {
                                                    ChallengeDetails(challenge: challenge)
                                                } label: {
                                                    ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                        .padding(.vertical)
                                                        .frame(width: 60.0, height: 60.0)
                                                    Text(challenge.name).foregroundColor(fontColor)
                                                    Text("\t")
                                                    // IF-ELSE Block um die zur Schwierigkeit der Challenge passende Darstellung anzuzeigen.
                                                    if (challenge.schwierigkeit == 1){
                                                        Text("🌱")
                                                        Text("🌱").opacity(0.4)
                                                        Text("🌱").opacity(0.4)
                                                    }else if (challenge.schwierigkeit == 2){
                                                        Text("🌱")
                                                        Text("🌱")
                                                        Text("🌱").opacity(0.4)
                                                    }else{
                                                        Text("🌱")
                                                        Text("🌱")
                                                        Text("🌱")
                                                    }
                                                }
                                            }.listRowBackground(bgColor)
                                        }
                                    }
                                    
                                }
                                
                                // Sektion für alle Challenges mit der Kategorie "Im Garten". (das Array wird wieder mittels forEach-Schleife durchlaufen um alle passenden Challenges zu finden.
                                Section(header: Text("Im Garten").foregroundColor(fontColor)) {
                                    ForEach(challenges) { challenge in
                                        let loop = challenge.kategorie
                                        if loop == "Im Garten" {
                                            HStack{
                                                // Hier wird für jede Challenge der Navogationslink zur passenden Ansicht (ChallengeDetails) erstellt.
                                                NavigationLink {
                                                    ChallengeDetails(challenge: challenge)
                                                } label: {
                                                    ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                        .padding(.vertical)
                                                        .frame(width: 60.0, height: 60.0)
                                                    Text(challenge.name).foregroundColor(fontColor)
                                                    Text("\t")
                                                    // IF-ELSE Block um die zur Schwierigkeit der Challenge passende Darstellung anzuzeigen.
                                                    if (challenge.schwierigkeit == 1){
                                                        Text("🌱")
                                                        Text("🌱").opacity(0.4)
                                                        Text("🌱").opacity(0.4)
                                                    }else if (challenge.schwierigkeit == 2){
                                                        Text("🌱")
                                                        Text("🌱")
                                                        Text("🌱").opacity(0.4)
                                                    }else{
                                                        Text("🌱")
                                                        Text("🌱")
                                                        Text("🌱")
                                                    }
                                                }
                                            }.listRowBackground(bgColor)
                                        }
                                    }
                                }
                                
                                
                            }.listStyle(PlainListStyle())
                                .scrollContentBackground(.hidden)
                                .background(bgColor)
                                .listRowBackground(bgColor)
                            
                        }.frame(width: geometry.size.width , height: geometry.size.height/1.22).background(bgColor)

                    }.frame(width: geometry.size.width , height: geometry.size.height/1.22).background(bgColor)
                    // Ende des Contents
                    
                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                    
                    TabBar()
                    
                }.background(barColor.ignoresSafeArea(edges: .top))
            }.navigationBarBackButtonHidden(true).navigationTitle("Challenges").accentColor(fontColor).navigationBarHidden(true).background(barColor.brightness(0.15)).navigationBarHidden(true)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
