//
//  ImageSlider.swift
//  LocalFood
//
//  Created by Steffen Schulz on 07.11.22.
//

import SwiftUI

struct ImageSlider: View {
    
    // Array mit den Bildern
    var images = [String]()
    @EnvironmentObject var modelDataC : ModelDataChallenge
    var challenges: [Challenge] = ModelDataChallenge().challenges
    @EnvironmentObject var modelData: ModelData
    var rezepte: [Rezept] = ModelData().rezepte
    
    
    init(images: [String]) {
        self.images = images
    }
    
    var body: some View {
        // TabView + tabViewStyle(PageTabViewStyle)
        TabView {
            ForEach(images, id: \.self) { item in
                let element = item
                if element == "StartseiteChallenge1"{
                    NavigationLink(destination: ChallengeDetails(challenge: challenges[0])){
                        Image(item).resizable().scaledToFill()
                    }
                    .navigationBarHidden(true)
                    .onAppear(){
                        UIView.setAnimationsEnabled(true)
                    }
                }
                
                else if element == "StartseiteChallenge2"{
                    NavigationLink(destination: ChallengeDetails(challenge: challenges[2])){
                        Image(item).resizable().scaledToFill()
                    }
                    .navigationBarHidden(true)
                }
                else if element == "StartseiteRezept1"{
                    NavigationLink(destination: RezeptView(rezept: rezepte[3], rating: .constant(4), kommentar: "")){
                        Image(item).resizable().scaledToFill()
                    }
                    .navigationBarHidden(true)
                }
                else if element == "StartseiteRezept2"{
                    NavigationLink(destination: RezeptView(rezept: rezepte[0], rating: .constant(4), kommentar: "")){
                        Image(item).resizable().scaledToFill()
                    }
                    .navigationBarHidden(true)
                }
                else if element == "StartseiteProdukt1"{
                    NavigationLink(destination: RezeptView(rezept: rezepte[3], rating: .constant(4), kommentar: "")){
                        Image(item).resizable().scaledToFill()
                    }
                    .navigationBarHidden(true)
                }
                
                
                
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
        
    }
}



struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(images: [String]()).previewLayout(.fixed(width: 400, height: 300))
    }
}
