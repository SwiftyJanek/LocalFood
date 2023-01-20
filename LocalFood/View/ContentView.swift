//
//  ContentView.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State var bgColor: Color = Color(red: 255/255, green: 255/255, blue: 226/255)

    @AppStorage("showWelcome") private var showWelcome = true
    
    var body: some View {

        GeometryReader { geometry in
            NavigationStack {
                VStack(spacing: 0){
                    HStack{
                        Text("Local").font(.title2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(fontColor)
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Food").font(.title2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(fontColor)
                    }.background(barColor.ignoresSafeArea(edges: .top)).padding(.bottom)
                    //HEADER
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)

                    // CONTENT
                    ScrollView{
                        if showWelcome == true {
                            Text("Willkommen bei LocalFood!").fontWeight(.bold).padding(.top, 15).foregroundColor(fontColor).shadow(radius: 5)
                        
                            Text("Wir haben es uns zur Aufgabe gemacht regionale Rezepte für jeden Geschmack anzubieten. Gepaart mit ein paar Herausforderung um deine Motivation zu steigern, hoffen wir, dich zu einem nachhaltigeren und regionalen Lebensstiel zu überzeugen.").multilineTextAlignment(.center).padding(.top, 15).foregroundColor(fontColor).shadow(radius: 5).font(.caption)
                            Button(action: {
                                self.showWelcome.toggle()
                            }) {
                                Text("Danke!")
                            }.padding()
                                .frame(maxWidth: 250)
                                .frame(width: 200, height: 40)
                                .background(fontColor)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .font(.headline)

                            
                            Divider()
                        }
                        

                        Text("Neuigkeiten").fontWeight(.bold).padding(.top, 15).foregroundColor(fontColor).shadow(radius: 5)
                        let images = ["StartseiteChallenge1","StartseiteChallenge2"]
                        ImageSlider(images: images)
                            .frame(height: 220)
                            .shadow(radius: 10)

                        
                        
                        
                        Text("Rezept der Woche").fontWeight(.bold).padding(.top,10).foregroundColor(fontColor).shadow(radius: 5)
                        let images2 = ["StartseiteRezept1","2"]
                        ImageSlider(images: images2).frame(height: 220).shadow(radius: 10)
                        
                        
                        
                        Text("Saisonale Rezepte").fontWeight(.bold).padding(.top, 10).foregroundColor(fontColor).shadow(radius: 5)
                        let images3 = ["StartseiteRezept2","StartseiteRezept1"]
                        ImageSlider(images: images3).frame(height: 220).shadow(radius: 10)
                        
                        
                        
                        Text("Saison Früchte").fontWeight(.bold).padding(.top, 10).foregroundColor(fontColor).shadow(radius: 5)
                        let images4 = ["StartseiteProdukt1"]
                        ImageSlider(images: images4).frame(height: 220).shadow(radius: 10)
                    }.frame(width: geometry.size.width , height: geometry.size.height/1.22).background(bgColor)

                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)



                    // TABBAR
                    TabBar()


                }.background(barColor.ignoresSafeArea(edges: .top))
                    .navigationTitle("Startseite")
                    .navigationBarTitleDisplayMode(.inline)

            }
            .navigationBarBackButtonHidden(true)
            .background(barColor)
            .foregroundColor(fontColor)
            

        }.edgesIgnoringSafeArea(.bottom).background(barColor)


    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
