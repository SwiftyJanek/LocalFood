//
//  ChallengeView.swift
//  LocalFood
//
//  Created by Steffen Schulz on 09.11.22.
//


import SwiftUI

struct ChallengeView: View {

    @State var progressValue: Float = 0.6
 
    

    var body: some View {

        GeometryReader { geometry in
            NavigationStack {

                VStack(spacing: 0){
                    HStack{
                        Image("Logo").resizable().frame(width: 35, height: 35)
                        Text("Challenges").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                    }.background(Color.white).padding(.bottom)
                    //HEADER
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)

                    // CONTENT
                    VStack(spacing: 0){
       
                        List{
                                
                                HStack{
                                    let images = ["1","2"]
                                    ImageSlider(images: images).frame(height: 262).shadow(radius: 10)
                                }
                                
                                Section(header: Text("Draußen in der Natur")) {
                              
                                    HStack {
                                        NavigationLink {
                                            // Link
                                        } label: {
                                            
                                        
                                            ProgressCircularBar(progress: $progressValue,imageName: "1" )
                                                .padding(.vertical)
                                                .frame(width: 60.0, height: 60.0)
                                                
                                            
                                            
                                            Text("Pilz Challange")
                                            Text("\t")
                                            Text("🌱")
                                            Text("🌱")
                                            Text("🌱").opacity(0.4)
                                           
                                            
                                        }
                                    }
                                    HStack {
                                        NavigationLink {
                                            // Link
                                        } label: {
                                            Image("1")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                            Text("Pilz Challange")
                                        }
                                    }
                                   
                                }
                                
                                Section(header: Text("Beim Einkaufen!")) {
                                    
                                    
                                    HStack {
                                        NavigationLink {
                                            // Link
                                        } label: {
                                            Image("2")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                            Text("Pilz Challange")
                                        }
                                    }
                                    HStack {
                                        NavigationLink {
                                            // Link
                                        } label: {
                                            Image("2")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                            Text("Pilz Challange")
                                        }
                                    }
                                    
                                    
                                    
                                }
                                
                                Section(header: Text("Beim Einkaufen!")) {
                                    
                                    
                                    HStack {
                                        NavigationLink {
                                            // Link
                                        } label: {
                                            Image("3")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                            Text("Pilz Challange")
                                        }
                                    }
                                    HStack {
                                        NavigationLink {
                                            // Link
                                        } label: {
                                            Image("4")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .clipShape(Circle())
                                            Text("Pilz Challange")
                                        }
                                    }

                                }
                        }.listStyle(PlainListStyle())
                    }.frame(width: geometry.size.width , height: geometry.size.height/1.22).background(Color.white)
                        
                    //Linie zwischen Navigation und Inhalt
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)
                            
                    TabBar()

                }
            }.navigationBarBackButtonHidden(true)

        }.edgesIgnoringSafeArea(.bottom)
    }
}


struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
