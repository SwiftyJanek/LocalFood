//
//  ContentView.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        
        GeometryReader { geometry in
            VStack{
                HStack{
                    Text("Local").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                    Image("Logo").resizable().frame(width: 35, height: 35)
                    Text("Food").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                }.background(Color.white)
                //HEADER
               
                
                // CONTENT
                ScrollView{
                    Text("Neuigkeiten").fontWeight(.bold).padding(.top, 15)
                    let images = ["1","2"]
                    ImageSlider(images: images).frame(height: 262).shadow(radius: 10)
                    Text("Rezept der Woche").fontWeight(.bold).padding(.top,10)
                    let images2 = ["3","4"]
                    ImageSlider(images: images2).frame(height: 262).shadow(radius: 10)
                    Text("Rezepte für Dich").fontWeight(.bold).padding(.top, 10)
                    ImageSlider(images: images2).frame(height: 262).shadow(radius: 10)
                    Text("Test1").fontWeight(.bold).padding(.top, 10)
                    ImageSlider(images: images).frame(height: 262).shadow(radius: 10)
                }.frame(width: geometry.size.width , height: geometry.size.height/1.23).border(Color.gray).background(Color.white)
                
                
                // TABBAR
                TabBar()
                
          
            }.background(Color.white)
       
        }.edgesIgnoringSafeArea(.bottom)
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

