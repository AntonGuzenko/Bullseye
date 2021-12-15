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
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .stroke(Color("ButtonStrokeColor"), lineWidth: 2.0)
            )
    }
}

struct RoundedImageVievFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
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
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
            .stroke(lineWidth: 2.0)
            .foregroundColor(Color("ButtonStrokeColor"))
            )
        
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
        RoundedImageVievStroked(systemName: "arrow.counterclockwise")
        RoundedImageVievFilled(systemName: "list.dash")
        RoundRectTextView(text: "100")
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
