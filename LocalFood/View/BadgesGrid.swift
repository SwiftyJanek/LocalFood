//
//  BadgesGrid.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.12.22.
//

import SwiftUI

struct BadgesGrid: View {
    var body: some View {
        BadgeGrid(badges: ["abzeichen", "tier", "wolf", "rakete"])
    }
}

struct BadgeGrid: View {
    var badges: [String]

    var body: some View {
        ScrollView(.horizontal) {
            HStack() {
                ForEach(self.badges, id: \.self) { badge in
                    HStack {
                        Image(badge)
                            .resizable()
                            .frame(width: 50, height: 50)
                        //Text(badge)
                    }
                }
            }
            .padding()
        }
    }
}

struct BadgesGrid_Previews: PreviewProvider {
    static var previews: some View {
        BadgesGrid()
    }
}
