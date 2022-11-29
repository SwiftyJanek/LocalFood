//
//  RezeptView.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI
import CoreData

struct RezeptView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack{
                    
                    ScrollView{
                        
                        /// Hier ändern
                        
                        
                        HStack{
                            Text("Rezepte").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                        }.padding(.top, 10)
                        Text("Neue Rezepte").fontWeight(.bold).padding(.top, 10)
                        let images = ["1","2"]
                        ImageSlider(images: images).frame(height: 262).shadow(radius: 10)
                        Text("Rezept der Woche").fontWeight(.bold).padding(.top,10)
                        let images2 = ["3","4"]
                        ImageSlider(images: images2).frame(height: 262).shadow(radius: 10)
                        Text("Rezepte für Dich").fontWeight(.bold).padding(.top, 10)
                        ImageSlider(images: images2).frame(height: 262).shadow(radius: 10)
                        Text("Challanges").fontWeight(.bold).padding(.top, 10)
                        ImageSlider(images: images).frame(height: 262).shadow(radius: 10)
                        
                        /// Hier Ende
                        
                        
                    }.frame(width: geometry.size.width , height: geometry.size.height/1.10).border(Color.gray).background(Color.white)
                    
                    TabBar()
                    
                    
                }
            }.navigationBarBackButtonHidden(true)
        }
        
    }
    
    
}

struct RezeptView_Previews: PreviewProvider {
    static var previews: some View {
        RezeptView()
    }
}
