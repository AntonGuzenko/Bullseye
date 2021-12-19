//
//  Shapes.swift
//  Bullseye
//
//  Created by Антон Гузенко on 15.12.2021.
//

import SwiftUI

struct Shapes: View {
    @State private var wideShades = true
    
    var body: some View {
        VStack{
            if !wideShades {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .transition(.scale)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShades ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShades ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShades ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            Button("Animate!") {
                withAnimation {
                wideShades.toggle()
                }
            }
        }
        .background(Color.green)

    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
