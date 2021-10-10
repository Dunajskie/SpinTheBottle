//
//  SpinerView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 13/09/2021.
//

import SwiftUI

struct SpinerView: View {
    @EnvironmentObject var settings: Settings
    let number: Int
    var rotation = 0.0
    var animation: Animation {
        Animation.easeOut
    }
    var lines: some View {
        ForEach(0..<8) { i in
            LineView(angle: 2 * .pi * CGFloat(Float(i) / Float(number)))
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                lines
                LogosView(persons: settings.persons, number: Float(settings.numberOfPlayers) ?? 0)
                ArrowView()
                    .rotationEffect(Angle.degrees(rotation))
                    .animation(animation)
                
            }
        }
    }
    mutating func rotate(angle: Double) {
        self.rotation = angle
    }
}

struct SpinerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinerView(number: 5)
    }
}
