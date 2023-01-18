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
    @State private var isDisclosed = false
    @State private var isDisclosed2 = false
    @State private var isDisclosed3 = false
    @State private var showImagePicker: Bool = false
    var arrowDown: Image = Image(systemName: "chevron.compact.down")
    var arrowUp: Image = Image(systemName: "chevron.compact.up")
      
     

    
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
                            Text("Pilz Suche").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                        }.padding(.top, 10)
                        ProgressBar(value: 0.33).frame(height: 15).padding([.leading, .trailing], 30)
                        Image("1")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 330, height: 220)
                            .clipShape(Rectangle())
                            .overlay { Rectangle().stroke(.white, lineWidth: 3) }
                            .shadow(radius: 7)
                        
                        VStack(alignment: .leading){
                            VStack{
                                HStack{
                                    Text("Schwierigkeit: \t").padding(.leading, 30)
                                        .font(.headline).padding(.bottom, 5)
                                    Text("🌱")
                                    Text("🌱")
                                    Text("🌱").opacity(0.4)
                                }
                                HStack{
                                    Text("Belohnung:      \t")
                                        .font(.headline)
                                    Text("120 🥬")
                                }
                            }
                            Divider().padding()
                        }
                        
                        HStack{
                            Text("Aufgabe").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                            
                        }.padding(.top, 10).padding(.bottom, 5)
                        HStack{
                            Text("Der Maronen-Röhrling sieht, einer Esskastanie sehr ähnlich. Das liegt vor allem daran, dass der Hut eine dunkle Farbe hat und die Form eher unregelmäßig gewölbt ist. Doch der Maronen-Pilz muss nicht braun sein. Auch ein hellerer rötlicher oder oliv-brauner Ton ist möglich. Der Stiel der Marone ist meist sehr gebogen und recht dick.")
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                            Spacer()
                        }
                        Divider().padding()
                    }
                    // ENDE HEADER CHallenge
                    
                    
                    // Bilder der Pilze + FOto Buttons
                    
                    //Marone Anfang
                    VStack{
                        
                        Text("Maronen-Röhrling").font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                        Image("Marone")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7).padding(.bottom, 10)
                        
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
                           
                            Text("Merkmale").font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5).padding(.top, 15)
                            Text("Der Maronen-Röhrling sieht, einer Esskastanie sehr ähnlich. Das liegt vor allem daran, dass der Hut eine dunkle Farbe hat und die Form eher unregelmäßig gewölbt ist. Doch der Maronen-Pilz muss nicht braun sein. Auch ein hellerer rötlicher oder oliv-brauner Ton ist möglich. Der Stiel der Marone ist meist sehr gebogen und recht dick.")
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                                .padding(.bottom, 10)
                            Text("Verbeitung").font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5)
                            Text("Besonders in Mitteleuropa ist der Pilz weit verbreitet. Hier findet man ihn hauptsächlich in Nadelwäldern. Dabei steht der oft zwischen den Wurzelausläufern von Fichten oder Lärchen. Die Hauptsaison des Maronen-Röhrling ist eigentlich der Herbst.")
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                            
                            
                            Button(action: {
                                self.showImagePicker.toggle()
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
                        }.frame(height: isDisclosed ? nil : 0, alignment: .top)
                            .clipped()
                        
                        
                        
                    }.frame(maxWidth: .infinity)
                     
                
                    //Marone Ende

                    Divider().padding()
                    //Pfifferling
                    VStack{
                        
                        Text("Pfifferling").font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                        
                        Image("Pfifferling")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7).padding(.bottom, 10)
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
                        Text("Merkmale").font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5).padding(.top, 15)
                        Text("Der Maronen-Röhrling sieht, einer Esskastanie sehr ähnlich. Das liegt vor allem daran, dass der Hut eine dunkle Farbe hat und die Form eher unregelmäßig gewölbt ist. Doch der Maronen-Pilz muss nicht braun sein. Auch ein hellerer rötlicher oder oliv-brauner Ton ist möglich. Der Stiel der Marone ist meist sehr gebogen und recht dick.")
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                            .padding(.bottom, 10)
                        Text("Verbeitung").font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5)
                        Text("Besonders in Mitteleuropa ist der Pilz weit verbreitet. Hier findet man ihn hauptsächlich in Nadelwäldern. Dabei steht der oft zwischen den Wurzelausläufern von Fichten oder Lärchen. Die Hauptsaison des Maronen-Röhrling ist eigentlich der Herbst.")
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                        
                        
                        Button(action: {
                            self.showImagePicker.toggle()
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
                        }.frame(height: isDisclosed2 ? nil : 0, alignment: .top)
                            .clipped()
                    }
                    //Pfifferling Ende
                    Divider().padding()
                    
                    //Steinpilz
                    
                    VStack{
                        
                        Text("Steinpilz").font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                        
                        Image("Steinpilz")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 4)
                            }
                            .shadow(radius: 7).padding(.bottom, 10)
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
                        Text("Merkmale").font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5).padding(.top, 15)
                        Text("Der Maronen-Röhrling sieht, einer Esskastanie sehr ähnlich. Das liegt vor allem daran, dass der Hut eine dunkle Farbe hat und die Form eher unregelmäßig gewölbt ist. Doch der Maronen-Pilz muss nicht braun sein. Auch ein hellerer rötlicher oder oliv-brauner Ton ist möglich. Der Stiel der Marone ist meist sehr gebogen und recht dick.")
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                            .padding(.bottom, 10)
                        Text("Verbeitung").font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5)
                        Text("Besonders in Mitteleuropa ist der Pilz weit verbreitet. Hier findet man ihn hauptsächlich in Nadelwäldern. Dabei steht der oft zwischen den Wurzelausläufern von Fichten oder Lärchen. Die Hauptsaison des Maronen-Röhrling ist eigentlich der Herbst.")
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing], 20)
                        
                        
                        Button(action: {
                            self.showImagePicker.toggle()
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
                        }.frame(height: isDisclosed3 ? nil : 0, alignment: .top)
                            .clipped()
                        
                    }
                    Divider().padding()
                    
                    //Steinpilz Ende
                    // Bilder der Pilze Ende
                    
                    Text("Rezept Empfehlungen").font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                    
                }.frame(width: geometry.size.width , height: geometry.size.height/1.083).background(barColor.brightness(0.55))
                    VStack{}
                        .frame(width: geometry.size.width , height: geometry.size.height/500).background(Color.gray)
                
                TabBar()
            }.onAppear(){
                UIView.setAnimationsEnabled(true)
            }.background(barColor.brightness(0.15).ignoresSafeArea(edges: .top))
        }
        
    }
    

    struct ChallengeDetails_Previews: PreviewProvider {
        static var previews: some View {
            ChallengeDetails()
        }
    }
}
