//
//  ChallangeDetails.swift
//  LocalFood
//
//  Created by Steffen Schulz on 16.01.23.
//

import SwiftUI

struct ChallengeDetails: View {
    
    // Variablen für die Verwendeten Farben
    @State var barColor: Color = Color(red: 166/255, green: 178/255, blue: 83/255)
    @State var fontColor: Color = Color(red: 51/255, green: 45/255, blue: 17/255)
    @State var bgColor: Color = Color(red: 255/255, green: 255/255, blue: 226/255)
    // Variablen für die Animationen der Challenge Bilder
    @State private var imageOne = false
    @State private var imageTwo = false
    @State private var imageThree = false
    @State private var isDisclosed = false
    @State private var isDisclosed2 = false
    @State private var isDisclosed3 = false
    @State private var showImagePicker: Bool = false
    // Variablen für die Pfeile zum Ausklappen der einzelnen Schritte
    var arrowDown: Image = Image(systemName: "chevron.compact.down")
    var arrowUp: Image = Image(systemName: "chevron.compact.up")
    
    // Daten Variablen die alle Challenges sowie Rezepte enthalten. Zudem enthält die Variable "challenge" die Challenge die beim Aufruf an die View übergegben wurde, um die korrekte Challenge anzuzeigen.
    @EnvironmentObject var modelDataC : ModelDataChallenge
    var challenge: Challenge
    var challenges: [Challenge] = ModelDataChallenge().challenges
    @EnvironmentObject var modelData: ModelData
    var rezepte: [Rezept] = ModelData().rezepte
    
    // Art der Animationen der einzelen Bilder und des Fortschrittbalkens
    @Namespace private var imageAnimationOne
    @Namespace private var imageAnimationTwo
    @Namespace private var imageAnimationThree
    @Namespace private var imageAnimationBar
    
    @State var refreshBar = false
    
    //Variablen für die Eingabe der Codes für die Nordsee Challenge
    @State var codeOne = ""
    @State var codeTwo = ""
    @State var codeThree = ""
    @State var codeFour = ""
    @State var code2One = ""
    @State var code2Two = ""
    @State var code2Three = ""
    @State var code2Four = ""
    @State var code3One = ""
    @State var code3Two = ""
    @State var code3Three = ""
    @State var code3Four = ""
    
    // feedbackGenerator für Rückmeldung beim Abschließen von Challenges
    var feedbackGenerator = UINotificationFeedbackGenerator()
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing:0){
                HStack(spacing:0){
                }.background(Color.white).padding(.bottom, 1).frame(width: geometry.size.width , height: geometry.size.height/2000)
                
                // Linie zwischen Header und Content der Seite
                VStack{}
                    .frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                
                // Cntent der Seite
                ScrollView{
                    VStack{
                        HStack{
                            Text(challenge.name).font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                        }.padding(.top, 10)
                        
                        // Anzeige des Fortschrittsbalkens um diesen dynamisch zu aktualisieren
                        VStack{
                            if refreshBar{
                                imageBarOne
                            }else{
                                imageBarTwo
                            }
                        }
                        
                        // Darstellung des Bildes für die Challenge
                        Image(challenge.bild1)
                            .resizable(resizingMode: .stretch)
                            .frame(width: 330, height: 220)
                            .clipShape(Rectangle())
                            .overlay { Rectangle().stroke(.white, lineWidth: 3) }
                            .shadow(radius: 7).onAppear(){
                                
                                // Löschen der alten JSON-Datei um die geänderten Daten zu speichern. onAppear = sobald die Seite erscheint
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
                            //Anzeige der Schwierigkeit und der Belohung wird dynamisch dargestellt, je nachdem um wleche Chalölenge es sich handelt.
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
                            }.padding(.leading, 60)
                            
                            Divider().padding()
                        }
                        
                        HStack{
                            Text("Aufgabe").font(.title2).fontWeight(.bold).multilineTextAlignment(.center)
                            
                        }.padding(.top, 10).padding(.bottom, 5)
                        // Erklärung der Aufgabe, wird dynamisch aus der JSON-Datei geladen
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
      
                    //Start von Schritt 1 der Challenge (z.B. Maronen-Röhrling)
                    VStack{
                        // Text des ersten Schrittes wird dynamisch aus "challenge" ausgelesen und eingefügt.
                        Text(challenge.step1Name).font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 10)
                        
                        // Darstellung des Bilder + Animationen (Die Animationen sind in den Variablen imageOneBig und imageOneSmall implementiert)
                        VStack{
                            if imageOne{
                                imageOneBig
                            }else{
                                imageOneSmall
                            }
                        }
                        
                        // Button zum aus und einklappen des ersten Schrittes
                        VStack{
                            Button(action: {
                                // Die Vsriable "isDisclosed" wird auf true oder false gesetzt, wodurch die Animation getriggert wird.
                                isDisclosed.toggle()
                            }, label: {
                                // Ändern des Pfeilrichtung
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
                        
                        
                        
                        // Dieser Teil klappt sich ein und aus.
                        VStack{
                            // Merkmale und Verbreitung des in dem Schritt behandelten Lebensmittels. Wird dynamisch geladen aus der Variablen "challenge"
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
                            
                            
                            //IF_ELSE Abfrage um die Darstellung der Challenge zu bestimmen (Pilz-Champ arbeitet mit Fotos, Nordsee mit Codes die man eingeben muss)
                            let idNow = challenge.id
                            if(idNow == 100 || idNow == 101){
                                // Button zum Foto aufnehmen + der BUtton wird auf grün gesetzt und der Fortschrittbalken aktualisiert.
                                Button(action: {
                                    if (challenge.step1 == false){
                                        self.showImagePicker.toggle()
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step1 = true
                                        isDisclosed.toggle()
                                        isDisclosed2.toggle()
                                        refreshBar.toggle()
                                        feedbackGenerator.notificationOccurred(.success)
                                        deleteCha(fileName: "Challenges")
                                        // Änderungen werden in die JSON-Datei gespeichert.
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
                                
                                // In der Nordsee-Challenge wird ein Code eingelöst, daher muss die Darstellung anders aufgebaut sein.
                                HStack{
                                    // vier Textfelder für die vier Zahlen des Codes
                                    TextField(" ", text: $codeOne).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $codeTwo).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $codeThree).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $codeFour).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    
                                }.frame(width: 234, height: 42).font(.title).background(fontColor)
                            
                                Button(action: {
                                    
                                    // Überprüfung des richtigen Codes
                                    if (challenge.step1 == false && codeOne == "1" && codeTwo == "2" && codeThree == "3" && codeFour == "4"){
                                        feedbackGenerator.notificationOccurred(.success)
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step1 = true
                                        isDisclosed.toggle()
                                        isDisclosed2.toggle()
                                        refreshBar.toggle()
                                        deleteCha(fileName: "Challenges")
                                        // Änderungen werden in die JSON-Datei gespeichert.
                                        for char in challenges {
                                            if (char.id == challenge.id){
                                                char.step1 = true
                                                char.progress = char.progress + 0.3
                                            }
                                            saveCha(object: char, fileName: "Challenges")
                                        }
                                    }
                                }) {
                                    
                                    Text("Einlösen")
                                        .padding()
                                        .frame(maxWidth: 250)
                                        .frame(width: 200, height: 40)
                                        .background(fontColor)
                                        .foregroundColor(.white)
                                        .clipShape(Capsule())
                                        .font(.headline)
                                }
                            }
                        }.frame(height: isDisclosed ? nil : 0, alignment: .top)
                            .clipped()
                    }.frame(maxWidth: .infinity)
                    
                    //Ende von Schritt 1 der Challenge (z.B. Maronen-Röhrling)
                    // Die Nachfolgenden Schritte 2+3 verhalten sich analog zu Schritt 1 deshalb wird auf eine Erklärung verzichtet.
                    Divider().padding()
                    

                    //Start von Schritt 2 der Challenge (z.B. Pfifferling)
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
                            Text(challenge.step2Header1).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5).padding(.top, 15)
                            Text(challenge.step2Header1Beschreibung)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                                .padding(.bottom, 10)
                            Text(challenge.step2Header2).font(.headline).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 5)
                            Text(challenge.step2Header2Beschreibung)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 20)
                            
                            let idNow = challenge.id
                            if(idNow == 100 || idNow == 101){
                                Button(action: {
                                    if (challenge.step2 == false){
                                        self.showImagePicker.toggle()
                                        feedbackGenerator.notificationOccurred(.success)
                                        challenge.progress = challenge.progress + 0.4
                                        challenge.step2 = true
                                        isDisclosed2.toggle()
                                        isDisclosed3.toggle()
                                        refreshBar.toggle()
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
                            }else{
                                
                                HStack{
                                    TextField(" ", text: $code2One).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $code2Two).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $code2Three).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $code2Four).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    
                                }.frame(width: 234, height: 42).font(.title).background(fontColor)
                                
                                Button(action: {
                                    if (challenge.step2 == false && code2One == "1" && code2Two == "2" && code2Three == "3" && code2Four == "4"){
                                        feedbackGenerator.notificationOccurred(.success)
                                        challenge.progress = challenge.progress + 0.4
                                        challenge.step2 = true
                                        isDisclosed2.toggle()
                                        isDisclosed3.toggle()
                                        refreshBar.toggle()
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
                                    Text("Einlösen")
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
                    //Ende von Schritt 2 der Challenge (z.B. Pfifferling)
                    
                    Divider().padding()
                    
                    //Start von Schritt 3 der Challenge (z.B. Steinpilz)
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
                                        feedbackGenerator.notificationOccurred(.success)
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step3 = true
                                        isDisclosed3.toggle()
                                        refreshBar.toggle()
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
                            }else{
                                HStack{
                                    
                                    TextField(" ", text: $code3One).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $code3Two).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $code3Three).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    TextField(" ", text: $code3Four).frame(width: 50, height: 40).font(.title).background(.white).multilineTextAlignment(.center).lineLimit(1)
                                    
                                }.frame(width: 234, height: 42).font(.title).background(fontColor)
                                Button(action: {
                                
                                    if (challenge.step3 == false && code3One == "1" && code3Two == "2" && code3Three == "3" && code3Four == "4"){
                                        feedbackGenerator.notificationOccurred(.success)
                                        challenge.progress = challenge.progress + 0.3
                                        challenge.step3 = true
                                        isDisclosed3.toggle()
                                        refreshBar.toggle()
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
                                    Text("Einlösen")
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
                    }
                    Divider().padding()
                    
                    //Ende von Schritt 3 der Challenge (z.B. Steinpilz)
                    
                    
                    
                    // Empfehlungen zu passenden Rezepten. Hierfür werden die oben geladenen Rezepte aus der JSON-Datei RezeptDaten verwendet.
                    // Anachließend wird per ForEach-Schleife abgefragt, welche Rezepte zu der Challenge passen.
                    Text("Rezept Empfehlungen").font(.title3).fontWeight(.bold).multilineTextAlignment(.center).padding(.bottom, 20)
                    let id = challenge.id
                    if(id == 100 || id == 101){
                        ForEach(rezepte) { rezept in
                            let name = rezept.name
                            if(name == "Pilz Pfanne"){
                                // Anschließend werden die passenden Rezepte angezeigt und können über den Navigationslink erreicht werden.
                                NavigationLink {
                                    RezeptView(rezept: rezept, rating: .constant(4), kommentar: "")
                                } label: {
                                    RezeptRow(rezept: rezept)
                                }
                                .listRowBackground(bgColor)
                                .multilineTextAlignment(.center)
                                .padding([.leading, .trailing], 30)
                                .onAppear(){
                                    UIView.setAnimationsEnabled(true)
                                }
                                Divider().padding()
                            }
                            
                        }
                        
                    }
                    
                }.frame(width: geometry.size.width , height: geometry.size.height/1.083).background(bgColor).navigationBarTitleDisplayMode(.inline)
                
                // Ende des Contents

                //Trenner zur Tabbar
                VStack{}.frame(width: geometry.size.width , height: geometry.size.height/500).background(fontColor)
                
                TabBar()
            }.onAppear(){
                UIView.setAnimationsEnabled(true)
            }.background(barColor.ignoresSafeArea(edges: .top))
        }
        
    }
    
    
// Variablen für die Animatioen der Bilder in Schritt 1-3
// Bild für Schritt 1
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
                // Wenn der Schritt geschaftt wurd, bekommt das Bild einen grünen Rahmen.
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
    
    
    
    // Bild für Schritt 2
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
    
    // Bild für Schritt 3
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
    

    //Variablen zur Darstellung der dynmaischen FortschrittsBar
    var imageBarOne: some View {
        VStack{
            imageChalBar
                .matchedGeometryEffect(id: "Bar", in: imageAnimationBar)
                .frame(height: 15).padding([.leading, .trailing], 30).padding(.bottom, 10)
        }
    }
    
    var imageBarTwo: some View {
        VStack{
            imageChalBar
                .matchedGeometryEffect(id: "Bar", in: imageAnimationBar)
                .frame(height: 15).padding([.leading, .trailing], 30).padding(.bottom, 10)
        }
    }
    
    var imageChalBar: some View{
        ProgressBar(value: challenge.progress).overlay {
        }
        .onTapGesture{
            withAnimation(.spring()){
                refreshBar.toggle()
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
