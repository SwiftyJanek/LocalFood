//
//  ProfileInfo.swift
//  LocalFood
//
//  Created by Janek Behrens on 13.12.22.
//

import SwiftUI

struct ProfileInfo: View {
    @State var progressValue: Float = 0.3

    var body: some View {
        NavigationStack{
            List {
                // Add your profile info here, such as an image and name
                HStack{
                    Image("profilePic")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Text("Janek Behrens")
                }
                HStack{
                    Text("Level: 1")
                    ProgressBar(value: $progressValue).frame(height: 20)
                    Text("2")
                }
                // Add a section for your profile details, such as your location and bio
                Section(header: Text("Details")) {
                    Text("Location: New York, NY")
                    Text("Bio: Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                }
                
                // Add a section for your social media accounts
                Section(header: Text("Social Media")) {
                    HStack {
                        Image("twitter-icon")
                        Text("@twitterhandle")
                    }
                    HStack {
                        Image("instagram-icon")
                        Text("@instagramhandle")
                    }
                }
            }
            .navigationBarTitle("Profile")    }
    }
}

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color(UIColor.systemBlue))
            }.cornerRadius(45.0)
        }
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo()
    }
}
