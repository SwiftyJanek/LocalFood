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
                    
                    HStack{
                        Text("Local").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Food").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                    }.background(Color.white).padding(.bottom)
                    //HEADER
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)

                    // CONTENT
                    
                    ProfileInfo(progressValue: 0.4).frame(width: geometry.size.width , height: geometry.size.height/1.22).background(Color.white)
                    
                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)
                    

                    TabBar()
                    
                }
            }.navigationBarBackButtonHidden(true)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
