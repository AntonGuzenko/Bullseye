//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Антон Гузенко on 15.12.2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BotttomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}


struct TopView: View {
    @Binding var game: Game
    
    
    var body: some View {
        HStack{
            Button(action:{
                game.restart()
            }) {
                RoundedImageVievStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            RoundedImageVievFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title.uppercased())
            RoundRectTextView(text: text)
        }
    }
}

struct BotttomView: View {
    @Binding var game: Game
    
    
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    
    @Environment(\.colorScheme) var colorShame
    
    var body: some View{
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) { ring in
                let size = CGFloat(ring * 100)
                let opasity = colorShame == .dark ? 0.5 : 0.3
            Circle()
                .stroke(lineWidth: 20.0)
                .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor ").opacity(opasity), Color("RingsColor").opacity(opasity)]), center:.center, startRadius: 50, endRadius: 300))
                .frame(width: size, height: size)
            }
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
