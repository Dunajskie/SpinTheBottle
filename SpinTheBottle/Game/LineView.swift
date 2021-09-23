//
//  LineView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 13/09/2021.
//

import SwiftUI

struct LineView: View {
    var angle: CGFloat
    var body: some View {
        GeometryReader { proxy in
            Path { path in
                path.move(to: CGPoint(x: proxy.size.width/2, y: proxy.size.height/2))
                path.addLine(to: CGPoint(x: proxy.size.width/2 + (proxy.size.width/2 - 1) * cos(angle) , y: proxy.size.height/2 + (proxy.size.width/2 - 1) * sin(angle)))
            } .stroke(Color.black, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round))
       }
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView(angle: .pi)
    }
}
