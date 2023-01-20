//
//  ProfilView.swift
//  LocalFood
//
//  Created by Steffen Schulz on 09.11.22.
//

import SwiftUI

struct ProfilView: View {
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State var bgColor: Color = Color(red: 255/255, green: 255/255, blue: 226/255)
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack(spacing: 0){

                    HStack{
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Profil").font(.title2).fontWeight(.bold).multilineTextAlignment(.center).foregroundColor(fontColor)
                    }.background(barColor).padding(.bottom)
                    //HEADER
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)

                    // CONTENT

                    ProfileInfo(progressValue: 0.4).frame(width: geometry.size.width , height: geometry.size.height/1.22).background(Color.white)

                    
                    
                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)


                    TabBar()

                }.background(barColor.ignoresSafeArea(edges: .top))
            }.navigationBarBackButtonHidden(true)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
