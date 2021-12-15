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
        Color("BackgroundColor")
            .edgesIgnoringSafeArea(.all)
        )
    }
}


struct TopView: View {
    @Binding var game: Game

    
    var body: some View {
        HStack{
          RoundedImageVievStroked(systemName: "arrow.counterclockwise")
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

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
