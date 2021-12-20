//
//  RoundViews.swift
//  Bullseye
//
//  Created by Антон Гузенко on 15.12.2021.
//

import SwiftUI

struct RoundedImageVievStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageVievFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
        
    }
}

struct RoundRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHieght)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
            .stroke(lineWidth: Constants.General.strokeWidth)
            .foregroundColor(Color("ButtonStrokeColor"))
            )
        
    }
}

struct RoundTextView:View {
    let text: String
    
    var body: some View {
    Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .stroke(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
  }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
        RoundedImageVievStroked(systemName: "arrow.counterclockwise")
        RoundedImageVievFilled(systemName: "list.dash")
        RoundRectTextView(text: "100")
            RoundRectTextView(text: "1")
        }
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
        
    }
}
