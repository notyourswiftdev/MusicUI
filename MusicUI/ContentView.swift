//
//  ContentView.swift
//  MusicUI
//
//  Created by Aaron Cleveland on 3/30/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import SwiftUI

class Song: ObservableObject {
    let title: String = "Low Life"
    let artist: String = "Future ft. The Weekend"
    let duration: TimeInterval = 120
    var currentTime: TimeInterval = 60
    let coverArt: UIImage = UIImage(named: "future")!
}

struct ContentView: View {

    @ObservedObject var song = Song()

    var body: some View {
        GeometryReader { geometry in
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
                    CoverArtView(size: geometry.size.width * 0.85)
                        .padding(.top, 15)
                        .padding(.bottom, 40)

                    Text(self.song.title)
                        .font(Font.system(.largeTitle).weight(.medium))
                        .foregroundColor(.buttonColor)

                    Text(self.song.artist)
                        .font(Font.system(.callout))
                        .foregroundColor(.buttonColor)

                    PlayerProgressView(song: self.song)
                        .padding(.top, 40)

                    Spacer()

                    HStack {
                        ReverseButton(imageName: "forward.fill")
                            .padding(.trailing, 15)
                        PlayPauseButton()
                        .frame(width: 100, height: 100)
                        ForwardButton(imageName: "forward.fill")
                            .padding(.leading, 15)
                    }

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PlayerProgressView: View {

    @ObservedObject var song: Song

    var trackRadius: CGFloat = 3

    var body: some View {
        VStack {
            HStack {
                Text("\(Int(self.song.currentTime))")
                Spacer()
                Text("\(Int(self.song.duration))")
            }
            .foregroundColor(.buttonColor)
            .font(Font.system(.caption))

            ZStack {
                RoundedRectangle(cornerRadius: trackRadius)
                    .fill(LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .bgGradientTop, location: 0.1),
                                                                    Gradient.Stop(color: Color.black.opacity(0.8), location: 0.5)]), startPoint: .bottom, endPoint: .top))
                    .frame(height: trackRadius * 2)
                GeometryReader { geometry in
                    HStack {
                    RoundedRectangle(cornerRadius: self.trackRadius)
                        .fill(LinearGradient(gradient: Gradient(colors: [.trackOrange, .trackYellow]),
                                         startPoint: .leading,
                                         endPoint: .trailing))
                        .frame(width: geometry.size.width * self.percentageCompleteForSong(), height: self.trackRadius * 2)
                    Spacer()
                    }
                }

                Circle()
                .fill(RadialGradient(gradient: Gradient(stops: [
                    Gradient.Stop(color: .trackYellow, location: 0.0),
                    Gradient.Stop(color: .bgGradientBottom, location: 0.00001),
                    Gradient.Stop(color: .bgGradientTop, location: 1)
                ]), center: .center, startRadius: 10, endRadius: 40))
                .frame(width: 40, height: 40)
            }
        }
        .padding(.horizontal, 30)
    }

    func percentageCompleteForSong() -> CGFloat {
        return CGFloat(song.currentTime / song.duration)
    }
}

//struct PlayerSliderValue: SliderStyle {
//
//}

struct CoverArtView: View {
    var size: CGFloat = 360

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.bgGradientBottom.opacity(0.7))
                .frame(width: size, height: size)
            Image("future")
                .resizable()
                .font(Font.system(.headline).weight(.bold))
                .aspectRatio(contentMode: .fill)
                .foregroundColor(.buttonColor)
                .frame(width: size * 0.94, height: size * 0.94)
                .background(LinearGradient(gradient: Gradient(colors: [.bgGradientTop, .bgGradientBottom]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                .clipShape(Circle())
        }
        .shadow(color: Color.black.opacity(0.4),
                radius: 20,
                x: 25,
                y: 25)
        .shadow(color: Color.white.opacity(0.1),
                radius: 15,
                x: -15,
                y: -15)
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
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
        }
    }
}

struct ReverseButton: View {
    var imageName: String

    var body: some View {
        Button(action: {
            // TODO: - Add the back navigation later
        }) {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(-180))
                .foregroundColor(.buttonColor)
                .frame(width: 20, height: 20)
                .padding(24)
                .background(LinearGradient(gradient: Gradient(colors: [.bgGradientTop,
                                                                       .bgGradientBottom]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
        }
    }
}

struct ForwardButton: View {
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
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
        }
    }
}

struct PlayPauseButton: View {

    @State var isPlaying = false

    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            ZStack {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                Circle()
                .fill(LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                    .padding(5)

                Image(systemName: isPlaying ? "pause" : "play.fill")
                    .foregroundColor(.white)
                    .font(Font.system(.callout).weight(.black))
            }
        }
    }

    func colorsForIsPlaying() -> [Color] {
        if isPlaying {
            return [.pauseLightOrange, .pauseDarkOrange]
        } else {
            return [.playLightGreen, .playDarkGreen]
        }
    }
}
