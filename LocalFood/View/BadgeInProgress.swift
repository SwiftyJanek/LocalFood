//
//  BadgeInProgress.swift
//  LocalFood
//
//  Created by Janek Behrens on 14.12.22.
//

import SwiftUI

struct BadgeInProgress: View {
    
    @State var progressValue: Float = 0.54
    
    var body: some View {
        
        ZStack {
            VStack {
                ProgressCircularBar(progress: self.$progressValue, imageName: "rakete")
                    .frame(width: 57.0, height: 57.0)
                
                Spacer()
            }
        }
    }
}
    
    struct ProgressCircularBar: View {
        @Binding var progress: Float
        @State var imageName: String
        
        var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 7.0)
                    .opacity(0.3)
                    .foregroundColor(Color.red)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
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
    


struct BadgeInProgress_Previews: PreviewProvider {
    static var previews: some View {
        BadgeInProgress()
    }
}
