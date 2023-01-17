//
//  BadgeInProgress.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.12.22.
//

import SwiftUI

    
    struct ProgressCircularBar: View {
        @State var progress: Float
        @State var imageName: String
        
        var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 7.0)
                    .opacity(0.3)
                    .foregroundColor(Color.red)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear(duration: 1), value: 1)
                
                Image(imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                
            }
        }
    }
    
    
