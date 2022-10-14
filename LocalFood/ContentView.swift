//
//  ContentView.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.10.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Local Food").font(.largeTitle)
            Spacer()
            TabView{
                Text("Hier Startseite")
                     .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Home")
                      }
                // So können wir auf andere Views verweisen, easy :D
                RezepteView()
                     .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Rezepte")
                      }
                Text("Hier Einkauf")
                     .tabItem {
                        Image(systemName: "cart")
                        Text("Einkauf")
                      }
                Text("Hier Profil")
                     .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profil")
                      }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
