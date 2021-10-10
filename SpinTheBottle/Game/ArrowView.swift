//
//  ArrowView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 13/09/2021.
//

import SwiftUI

struct ArrowView: View {
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                path.move(to: CGPoint(x: proxy.size.width/2, y: 80))
                path.addLine(to: CGPoint(x: proxy.size.width/2, y: proxy.size.height - 100))
            }.stroke(Color.darkPink, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            Path { path in
                path.move(to: CGPoint(x: proxy.size.width/2 - 15, y: proxy.size.height - 100))
                path.addLine(to: CGPoint(x: proxy.size.width/2 + 15, y: proxy.size.height - 100))
                path.addLine(to: CGPoint(x: proxy.size.width/2, y: proxy.size.height - 70))
            }.fill(Color.darkPink)
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
