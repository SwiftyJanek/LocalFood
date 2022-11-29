//
//  ProfileImageCircle.swift
//  LocalFood
//
//  Created by Janek Behrens on 25.11.22.
//

import SwiftUI

struct ProfileImageCircle: View {
    var body: some View {
        Image("profilePic")
            .resizable(resizingMode: .stretch)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct ProfileImageCircle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageCircle()
    }
}
