//
//  ChallangeDetails.swift
//  LocalFood
//
//  Created by Steffen Schulz on 16.01.23.
//

import SwiftUI

struct ChallengeDetails: View {
    
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State private var progress = false
    @State private var imageOne = false
    @State private var imageTwo = false
    @State private var imageThree = false
    @State private var isDisclosed = false
    @State private var isDisclosed2 = false
    @State private var isDisclosed3 = false
    @State private var showImagePicker: Bool = false
    var arrowDown: Image = Image(systemName: "chevron.compact.down")
    var arrowUp: Image = Image(systemName: "chevron.compact.up")
    @EnvironmentObject var modelDataC : ModelDataChallenge
    var challenge: Challenge
    var challenges: [Challenge] = ModelDataChallenge().challenges
    @Namespace private var imageAnimationOne
    @Namespace private var imageAnimationTwo
    @Namespace private var imageAnimationThree
   
    
    var body: some View {
        
      
        
        GeometryReader { geometry in

            VStack(spacing:0){
                
                HStack(spacing:0){
                }.background(Color.white).padding(.bottom, 1).frame(width: geometry.size.width , height: geometry.size.height/2000)
                
                //Linie zwischen Navigation und Inhalt
                VStack{}
                    .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)
                

                ScrollView{
                    
                    // ANFANG HEADER CHallenge
                    VStack{
                        HStack{
                            Text(challenge.name).font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                        }.padding(.top, 10)
                        
                        
                    ProgressBar(value: challenge.progress).frame(height: 15).padding([.leading, .trailing], 30).padding(.bottom, 10)
                     
                        
                        Image(challenge.bild1)
                            .resizable(resizingMode: .stretch)
                            .frame(width: 330, height: 220)
                            .clipShape(Rectangle())
                            .overlay { Rectangle().stroke(.white, lineWidth: 3) }
                            .shadow(radius: 7).onAppear(){
                                
                                
                                deleteCha(fileName: "Challenges")
                                for char in challenges {
                                    if (char.id == challenge.id){
                                        char.finished = true
                                    }else{
                                        char.finished = false
                                    }
                                    saveCha(object: char, fileName: "Challenges")
                                }
                                
                                
                                
                                
                            }
                        
                        VStack(alignment: .leading){
                            VStack{
                                HStack{
                                    
    
                                    Text("Schwierigkeit: \t").padding(.leading, 30)
                                        .font(.headline).padding([.bottom, .top], 10)
                                    
                                    if (challenge.schwierigkeit == 1){
                                        Text("🌱")
                                        Text("🌱").opacity(0.4)
                                        Text("🌱").opacity(0.4)
                                    }else if (challenge.schwierigkeit == 2){
                                        Text("🌱")
                                        Text("🌱")
                                        Text("🌱").opacity(0.4)
                                    }else {
                                        Text("🌱")
                                        Text("🌱")
                                        Text("🌱")
                                        
                                    }

                                }
                                HStack{
                                    Text("Belohnung:      \t")
                                        .font(.headline)
                                    Text("\(challenge.belohnung) 🥬")
                                }
                            }
                            Divider().padding()
                        }
                        
                        HStack{
                            Text("Aufgabe").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                            
                        }.padding(.top, 10).padding(.bottom, 5)
                        HStack{
                            Text(challenge.aufgabe)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                            Spacer()
                        }
                        Divider().padding()
                    }
                    // ENDE HEADER CHallenge
                    
                    
                    // Bilder der Pilze + Foto Buttons
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //Marone Anfang
                    VStack{
                        
                        Text(challenge.step1Name).font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                        VStack{
                            
                            if imageOne{
                                imageOneBig
                          
                            }else{
                                imageOneSmall
                            }
                        }
                        VStack{
                            Button(action: {
                                isDisclosed.toggle()
                            }, label: {
                                           
                                if(isDisclosed == false){
                                    arrowDown.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(fontColor)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                }else{
                                    arrowUp.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(fontColor)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                }
                                    
                            })

                            .buttonStyle(.plain).multilineTextAlignment(.center).font(.title)
                        }.frame(height: 10)
                        VStack{
                           
                            Text(challenge.step1Header1).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5).padding(.top, 15)
                            Text(challenge.step1Header1Beschreibung)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                                .padding(.bottom, 10)
                            Text(challenge.step1Header2).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5)
                            Text(challenge.step1Header2Beschreibung)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
 
                            
                            
                            
                            
                            // IF ELSE FÜR BUTTON
                            
                            
                            let idNow = challenge.id
                            if(idNow == 100 || idNow == 101){
                                // Button für Foto
                                Button(action: {
                                    
                                    
                                    if (challenge.step1 == false){
                                        self.showImagePicker.toggle()
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step1 = true
                                        isDisclosed.toggle()
                                        isDisclosed2.toggle()
                                        deleteCha(fileName: "Challenges")
                                        for char in challenges {
                                            if (char.id == challenge.id){
                                                char.step1 = true
                                                char.progress = char.progress + 0.3
                                            }
                                            saveCha(object: char, fileName: "Challenges")
                                        }
                                    }
                         
                                    
                                }) {
                                    Text("Gefunden")
                                }
                                .sheet(isPresented: $showImagePicker) {
                                    CameraOpen(showImagePicker: self.$showImagePicker)
                                }
                                .padding()
                                .frame(maxWidth: 250)
                                .frame(width: 200, height: 40)
                                .background(fontColor)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .font(.headline)
                                // Ende BUtton für Foto
                                
                            }else{
                                
                                Button(action: {
                                    
                                    // Änderung in der JSON Datei
                                    if (challenge.step1 == false){
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step1 = true
                                        isDisclosed.toggle()
                                        isDisclosed2.toggle()
                                        deleteCha(fileName: "Challenges")
                                        for char in challenges {
                                            if (char.id == challenge.id){
                                                char.step1 = true
                                                char.progress = char.progress + 0.3
                                            }
                                            saveCha(object: char, fileName: "Challenges")
                                        }
                                    }
                                }) {
                                    Text("Gefunden")
                                        .padding()
                                        .frame(maxWidth: 250)
                                        .frame(width: 200, height: 40)
                                        .background(fontColor)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .font(.headline)
                                    
                                }
                            }
                            
                            
                            
                            
                            // IF ELSE für Button
                            
                            
                      
                            
                        }.frame(height: isDisclosed ? nil : 0, alignment: .top)
                            .clipped()
                        
                        
                        
                    }.frame(maxWidth: .infinity)
                     
                
                    //Marone Ende

                    Divider().padding()
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //Pfifferling
                    VStack{
                        
                        Text(challenge.step2Name).font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                    
                              VStack{
                                
                                if imageTwo{
                                    imageTwoBig
                                    
                                }else{
                                    imageTwoSmall
                                }
                            }

                        VStack{
                            Button(action: {
                                isDisclosed2.toggle()
                            }, label: {
                                           
                                if(isDisclosed2 == false){
                                    arrowDown.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(fontColor)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                }else{
                                    arrowUp.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(fontColor)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                }
                            })
                            .buttonStyle(.plain).multilineTextAlignment(.center).font(.title)
                        }.frame(height: 10)
                        
                        
                        
                        VStack{
                            Text(challenge.step1Header1).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5).padding(.top, 15)
                            Text(challenge.step1Header1Beschreibung)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                            .padding(.bottom, 10)
                        Text(challenge.step1Header2).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5)
                        Text(challenge.step1Header2Beschreibung)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                        
                        
                            
                           
                            
                            
                            
                            let idNow = challenge.id
                            if(idNow == 100 || idNow == 101){
                                // Button für Foto
                                Button(action: {
                                    
                                    if (challenge.step2 == false){
                                        self.showImagePicker.toggle()
                                        challenge.progress = challenge.progress + 0.4
                                        challenge.step2 = true
                                        isDisclosed2.toggle()
                                        isDisclosed3.toggle()
                                        deleteCha(fileName: "Challenges")
                                        for char in challenges {
                                            if (char.id == challenge.id){
                                                char.step2 = true
                                                char.progress = char.progress + 0.4
                                            }
                                            saveCha(object: char, fileName: "Challenges")
                                        }
                                    }
                                   
                                }) {
                                    Text("Gefunden")
                                }
                                .sheet(isPresented: $showImagePicker) {
                                    CameraOpen(showImagePicker: self.$showImagePicker)
                                }
                                .padding()
                                .frame(maxWidth: 250)
                                .frame(width: 200, height: 40)
                                .background(fontColor)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .font(.headline)
                                // Ende BUtton für Foto
                                
                            }else{
                                
                                Button(action: {
                                    
                                    // Änderung in der JSON Datei
                                    if (challenge.step2 == false){
                                        challenge.progress = challenge.progress + 0.4
                                        challenge.step2 = true
                                        isDisclosed2.toggle()
                                        isDisclosed3.toggle()
                                        deleteCha(fileName: "Challenges")
                                        for char in challenges {
                                            if (char.id == challenge.id){
                                                char.step2 = true
                                                char.progress = char.progress + 0.4
                                            }
                                            saveCha(object: char, fileName: "Challenges")
                                        }
                                    }
                                }) {
                                    Text("Gefunden")
                                        .padding()
                                        .frame(maxWidth: 250)
                                        .frame(width: 200, height: 40)
                                        .background(fontColor)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .font(.headline)
                                    
                                }
                                
                                
                                
                            }
                            
                            
                            

                            
                            
                            
                            
                            
                        }.frame(height: isDisclosed2 ? nil : 0, alignment: .top)
                            .clipped()
                    }
                    //Pfifferling Ende
                    Divider().padding()
                    
                    //Steinpilz
                    
                    VStack{
                        
                        Text(challenge.step3Name).font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                        
                     
                        
                                VStack{
                                    
                                    if imageThree{
                                        imageThreeBig
                                  
                                    }else{
                                        imageThreeSmall
                                    }
                                }
                                
                        
                        
                        VStack{
                            
                            
                            Button(action: {
                                isDisclosed3.toggle()
                                
                            }, label: {
                                           
                                if(isDisclosed3 == false){
                                    arrowDown.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(fontColor)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                }else{
                                    arrowUp.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(fontColor)
                                    .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
                                }

                            })
                            
                            .buttonStyle(.plain).multilineTextAlignment(.center).font(.title)
                        }.frame(height: 10)
                        VStack{
                        Text(challenge.step3Header1).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5).padding(.top, 15)
                            Text(challenge.step3Header1Beschreibung)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                            .padding(.bottom, 10)
                        Text(challenge.step3Header2).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5)
                        Text(challenge.step3Header2Beschreibung)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                        
                            
                            
                            
                            let idNow = challenge.id
                            if(idNow == 100 || idNow == 101){
                                // Button für Foto
                                Button(action: {
                                    
                                    if (challenge.step3 == false){
                                        self.showImagePicker.toggle()
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step3 = true
                                        isDisclosed3.toggle()
                                        deleteCha(fileName: "Challenges")
                                        for char in challenges {
                                            if (char.id == challenge.id){
                                                char.step3 = true
                                                char.progress = char.progress + 0.3
                                            }
                                            saveCha(object: char, fileName: "Challenges")
                                        }
                                    }
                                    
                                }) {
                                    Text("Gefunden")
                                }
                                .sheet(isPresented: $showImagePicker) {
                                    CameraOpen(showImagePicker: self.$showImagePicker)
                                }
                                .padding()
                                .frame(maxWidth: 250)
                                .frame(width: 200, height: 40)
                                .background(fontColor)
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                                .font(.headline)
                                // Ende BUtton für Foto
                                
                            }else{
                                
                                Button(action: {
                                    
                                    // Änderung in der JSON Datei
                                    if (challenge.step3 == false){
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step3 = true
                                        isDisclosed3.toggle()
                                        deleteCha(fileName: "Challenges")
                                        for char in challenges {
                                            if (char.id == challenge.id){
                                                char.step3 = true
                                                char.progress = char.progress + 0.3
                                            }
                                            saveCha(object: char, fileName: "Challenges")
                                        }
                                    }
                                    
                                }) {
                                    Text("Gefunden")
                                        .padding()
                                        .frame(maxWidth: 250)
                                        .frame(width: 200, height: 40)
                                        .background(fontColor)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .font(.headline)
                                    
                                }
                            
                            }
                            
                            
    
                            
                        }.frame(height: isDisclosed3 ? nil : 0, alignment: .top)
                            .clipped()
                        // Ende Button für Foto
                        
                        
                        
                        
                        
                        
                    }
                    Divider().padding()
                    
                    //Steinpilz Ende
                    // Bilder der Pilze Ende
                    
                    Text("Rezept Empfehlungen").font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                    
                }.frame(width: geometry.size.width , height: geometry.size.height/1.083).background(barColor.brightness(0.55)).navigationBarTitleDisplayMode(.inline)
                
                
                
                
                
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)
                
                TabBar()
            }.onAppear(){
                UIView.setAnimationsEnabled(true)
            }.background(barColor.brightness(0.15).ignoresSafeArea(edges: .top))
        }
        
    }
    
    
    // Bilder größer und kleiner
    var imageOneSmall: some View {
        VStack{
            imageChalOne
            .matchedGeometryEffect(id: "ImageOne", in: imageAnimationOne)
            .frame(width: 150, height: 150)
        }
    }
    
    var imageOneBig: some View {
        VStack{
                imageChalOne
                .matchedGeometryEffect(id: "ImageOne", in: imageAnimationOne)
                .frame(width: 320, height: 320)
        }
    }
    
    var imageChalOne: some View{
        Image(challenge.bild2)
        
            .resizable()
            .clipShape(Circle())
            .overlay {
                
                if (challenge.step1 == true){
                    Circle().stroke(.green, lineWidth: 4)
                }else{
                    Circle().stroke(.white, lineWidth: 4)
                }   
                

            }
            .shadow(radius: 7).padding(.bottom, 10)
            .onTapGesture{
                withAnimation(.spring()){
                    imageOne.toggle()
                }
            }
    }
    
    // Bild 2
    var imageTwoSmall: some View {
        VStack{
            imageChalTwo
            .matchedGeometryEffect(id: "ImageTwo", in: imageAnimationTwo)
            .frame(width: 150, height: 150)
        }
    }
    
    var imageTwoBig: some View {
        VStack{
                imageChalTwo
                .matchedGeometryEffect(id: "ImageTwo", in: imageAnimationTwo)
                .frame(width: 320, height: 320)
        }
    }
    
    var imageChalTwo: some View{
        Image(challenge.bild3)
        
            .resizable()
            .clipShape(Circle())
            .overlay {
                 
                if (challenge.step2 == true){
                    Circle().stroke(.green, lineWidth: 4)
                }else{
                    Circle().stroke(.white, lineWidth: 4)
                }

            }
            .shadow(radius: 7).padding(.bottom, 10)
            .onTapGesture{
                withAnimation(.spring()){
                    imageTwo.toggle()
                }
            }
    }

    
    // Bild 3
    
    var imageThreeSmall: some View {
        VStack{
            imageChalThree
            .matchedGeometryEffect(id: "ImageThree", in: imageAnimationThree)
            .frame(width: 150, height: 150)
        }
    }
    
    var imageThreeBig: some View {
        VStack{
                imageChalThree
                .matchedGeometryEffect(id: "ImageThree", in: imageAnimationThree)
                .frame(width: 320, height: 320)
        }
    }
    
    var imageChalThree: some View{
        Image(challenge.bild4)
        
            .resizable()
            .clipShape(Circle())
            .overlay {
               
                if (challenge.step3 == true){
                    Circle().stroke(.green, lineWidth: 4)
                }else{
                    Circle().stroke(.white, lineWidth: 4)
                }
                
                
            }
            .shadow(radius: 7).padding(.bottom, 10)
            .onTapGesture{
                withAnimation(.spring()){
                    imageThree.toggle()
                }
            }
    }


    
    struct ChallengeDetails_Previews: PreviewProvider {
        static let modelDataC = ModelDataChallenge()
        static var previews: some View {
            ChallengeDetails(challenge: modelDataC.challenges[0]).environmentObject(modelDataC)
        }
    }


}
