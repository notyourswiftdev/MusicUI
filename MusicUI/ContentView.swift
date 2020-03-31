//
//  ContentView.swift
//  MusicUI
//
//  Created by Aaron Cleveland on 3/30/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            // This will hold every view on top of the background gradient
            VStack {
                HStack {
                    BasicButton(imageName: "arrow.left")
                        .padding(.leading, 30)
                    Spacer()
                    Text("PLAYING NOW")
                        .foregroundColor(.buttonColor)
                        .font(Font.system(.headline).smallCaps())
                    Spacer()
                    BasicButton(imageName: "line.horizontal.3")
                        .padding(.trailing, 30)
                }
                .padding(.top, 20)
                Spacer()

                PlayPauseButton()
                .frame(width: 100, height: 100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicButton: View {
    var imageName: String

    var body: some View {
        Button(action: {
            // TODO: - Add the back navigation later
        }) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.buttonColor)
                .frame(width: 20, height: 20)
                .padding(24)
                .background(LinearGradient(gradient: Gradient(colors: [.bgGradientTop,
                                                                       .bgGradientBottom]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.3),
                        radius: 10,
                        x: 5,
                        y: 5)
                .shadow(color: Color.white.opacity(0.1),
                        radius: 10,
                        x: -5,
                        y: -5)
        }
    }
}

struct PlayPauseButton: View {
    @State var isPlaying = true

    var body: some View {
        Button(action: {
            // TODO: - Add later
        }) {
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.pauseLightOrange, .pauseDarkOrange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.pauseLightOrange, .pauseDarkOrange]), startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                    .padding(5)

                Image(systemName: isPlaying ? "pause" : "play.fill")
                    .foregroundColor(.white)
                    .font(Font.system(.callout).weight(.black))
            }
        }
    }
    func colorsForIsPlaying() -> [Color] {
        
    }
}
