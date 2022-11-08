//
//  TabBar.swift
//  LocalFood
//
//  Created by Steffen Schulz on 08.11.22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        
        GeometryReader { geometry in
        
        HStack{
                 TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "house", tabName: "Start")
                 TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "fork.knife", tabName: "Rezepte")
            ZStack{
                Circle().foregroundColor(.white)
                    .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                    .shadow(radius: 4)
                Image(systemName: "plus.circle")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                         
            }.offset(y: -geometry.size.height/3/1)
            
                TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "trophy", tabName: "Challanges")
                 TabBarIcon(width: geometry.size.width/5, height: geometry.size.height/3, systemIconName: "person.crop.circle", tabName: "Profil")
        }.frame(width: geometry.size.width, height: geometry.size.height/1).shadow(radius: 2).background(Color.white).edgesIgnoringSafeArea(.bottom)
            
        }.edgesIgnoringSafeArea(.bottom)
        }
    }


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
