//
//  ProfilView.swift
//  LocalFood
//
//  Created by Steffen Schulz on 09.11.22.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                
                VStack(spacing: 0){
                    
                    ScrollView{
                        
                        
                        HStack{
                            Text("Profil").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                        }.padding(.top, 10)
                        Text("Profil hier anzeigen").fontWeight(.bold).padding(.top, 10)
                        Text("Beispiel User").fontWeight(.bold).padding(.top, 10)
                        Spacer()
                        let images = ["1","2"]
                        ImageSlider(images: images).frame(height: 262).shadow(radius: 10)
                        
                        
                        
                        
                        
                    }.frame(width: geometry.size.width , height: geometry.size.height/1.095).border(Color.gray).background(Color.white)
                    
                    TabBar()
                    
                    
                }
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
