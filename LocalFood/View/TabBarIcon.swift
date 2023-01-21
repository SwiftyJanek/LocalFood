//
//  TabBarIcon.swift
//  LocalFood
//
//  Created by Steffen Schulz on 07.11.22.
//

// Icon für die einzelnen Punkte der TabBar
import SwiftUI

struct TabBarIcon: View {
    let width, height: CGFloat
    let systemIconName, tabName: String
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }.padding(.horizontal, -4)
    }
}



