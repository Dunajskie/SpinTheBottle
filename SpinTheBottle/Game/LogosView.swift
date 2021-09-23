//
//  LogosView.swift
//  SpinTheBottle
//
//  Created by Michał Dunajski on 20/09/2021.
//

import SwiftUI

struct LogosView: View {
    var persons: [Person]
    var number: Float
    var angle: CGFloat = 0
    var body: some View {
        GeometryReader { proxy in
            ForEach(persons, id: \.id) { person in
                let personId: Float = Float(person.personID)
                let offset: Float = 2 * Float(Double.pi) * personId / number + Float(Double.pi) / number
                Text(person.avatar)
                    .position(x: proxy.size.width/2 + (proxy.size.width/2 - 40) * cos(CGFloat(offset)), y: proxy.size.height/2 + (proxy.size.width/2 - 40) * sin(CGFloat(offset)))
                    .font(.system(size: 40))
            }
        }
    }
}

//struct LogosVlet_Previews: PreviewProvider {
//    static var previews: some View {
//        LogosView()
//    }
//}
