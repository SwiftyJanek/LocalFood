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
                    
                    ProfileInfo(progressValue: 0.4).frame(width: geometry.size.width , height: geometry.size.height/1.23).border(Color.gray).background(Color.white)

                    TabBar()
                    
                }
            }
            .headerProminence(.increased)
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
