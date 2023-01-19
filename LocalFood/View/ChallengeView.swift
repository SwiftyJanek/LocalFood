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
    var challenges: [Challenge] = ModelDataChallenge().challenges
    @State var progressValue: Float = 0.6
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    

    var body: some View {

        GeometryReader { geometry in
            NavigationStack {

                VStack(spacing: 0){
                    HStack{
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Challenges").font(.title2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(fontColor)
                    }.background(barColor.brightness(0.15)).padding(.bottom)
                    //HEADER
                    
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)
                    
                    // CONTENT
                    
                    // Scroll
                    
                    
                    ScrollView{
                    
                    
                    VStack(spacing: 0){
                        
                        List{
                            Section(header: Text("In Bearbeitung").foregroundColor(fontColor)) {
                                HStack{
                                    NavigationLink {
                                        // ChallengeDetails(challenge: challenge)
                                    } label: {
                                        ProgressCircularBar(progress: 0.5, imageName: "pilzChamp" )
                                            .padding(.vertical)
                                            .frame(width: 60.0, height: 60.0)
                                        Text("Pilz Challenge").foregroundColor(fontColor)
                                        Text(" ")
                                        ProgressBar(value: 0.5).frame(height: 15)
                                        Text(" ")
                                    }
                                }.listRowBackground(barColor.brightness(0.55))
                            }
                            
                            HStack{
                                let images = ["1","2"]
                                ImageSlider(images: images).frame(height: 262).shadow(radius: 10)
                            }.listRowBackground(barColor.brightness(0.55))
                            
                 
                            Section(header: Text("Draußen in der Natur").foregroundColor(fontColor)) {
                                
                                ForEach(challenges) { challenge in
                                    let loop = challenge.kategorie
                                    if loop == "Draußen in der Natur" {
                                        HStack{
                                            NavigationLink {
                                                ChallengeDetails(challenge: challenge)
                                            } label: {
                                                ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                    .padding(.vertical)
                                                    .frame(width: 60.0, height: 60.0)
                                                Text(challenge.name).foregroundColor(fontColor)
                                                Text("\t")
                                                
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
                                        }.listRowBackground(barColor.brightness(0.55))
                                    }
                                }
                            }
                                    
                            
                     
                            Section(header: Text("Beim Einkaufen").foregroundColor(fontColor)) {
                                
                                
                                ForEach(challenges) { challenge in
                                    let loop = challenge.kategorie
                                    if loop == "Beim Einkaufen" {
                                        HStack{
                                            NavigationLink {
                                                ChallengeDetails(challenge: challenge)
                                            } label: {
                                                ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                    .padding(.vertical)
                                                    .frame(width: 60.0, height: 60.0)
                                                Text(challenge.name).foregroundColor(fontColor)
                                                Text("\t")
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
                                        }.listRowBackground(barColor.brightness(0.55))
                                    }
                                }
                                
                            }
                            
                            
                      
                            Section(header: Text("Beim Kochen").foregroundColor(fontColor)) {
                                
                                
                                ForEach(challenges) { challenge in
                                    let loop = challenge.kategorie
                                    if loop == "Beim Kochen" {
                                        HStack{
                                            NavigationLink {
                                                ChallengeDetails(challenge: challenge)
                                            } label: {
                                                ProgressCircularBar(progress: challenge.progress, imageName: challenge.badge )
                                                    .padding(.vertical)
                                                    .frame(width: 60.0, height: 60.0)
                                                Text(challenge.name).foregroundColor(fontColor)
                                                Text("\t")
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
                                        }.listRowBackground(barColor.brightness(0.55))
                                    }
                                }
                                
                                
                            }
                            
                        }.listStyle(PlainListStyle())
                            .scrollContentBackground(.hidden)
                            .background(barColor.brightness(0.55))
                            .listRowBackground(barColor.brightness(0.55))
                        
                    }.frame(width: geometry.size.width , height: geometry.size.height/1.22).background(barColor.brightness(0.55))
                    
                    
                    
                }.frame(width: geometry.size.width , height: geometry.size.height/1.22).background(barColor.brightness(0.55))
                   
                    
                    // Scrol
                    
                    
                    
                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)
                            
                    TabBar()

                }.background(barColor.brightness(0.15).ignoresSafeArea(edges: .top))
            }.navigationBarBackButtonHidden(true).navigationTitle("Challenges").accentColor(fontColor).navigationBarHidden(true).background(barColor.brightness(0.15))
            
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}


struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
