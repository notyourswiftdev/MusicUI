//
//  SearchView.swift
//  MusicUI
//
//  Created by Aaron Cleveland on 7/9/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var contentView: Bool = false
    @State private var searchText = ""
    
    let songs = ["Blinding Lights", "That Way", "This Is Me"]
    var body: some View {
        ZStack {
            VStack {
                // onCommit method is called when the user pressed Return on their keyboard.
                TextField("Search Songs", text: $searchText, onCommit: {
                    print(self.searchText)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
                .accentColor(.pink)
                List {
                    // 1
                    ForEach(songs, id:\.self) { songTitle in
                        // 2
                        HStack {
                            // 3
                            Image(systemName: "rectangle.stack.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(5)
                                .shadow(radius: 2)
                            // 4
                            VStack(alignment: .leading) {
                                Text(songTitle)
                                    .font(.headline)
                                Text("Artist Name")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            // 5
                            Button(action: {
                                print("Playing \(songTitle)")
                            }) {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.pink)
                            }
                        }
                    }
                    .fullScreenCover(isPresented: $contentView, onDismiss: nil) {
                        ContentView()
                    }
                }
                .accentColor(.pink)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
