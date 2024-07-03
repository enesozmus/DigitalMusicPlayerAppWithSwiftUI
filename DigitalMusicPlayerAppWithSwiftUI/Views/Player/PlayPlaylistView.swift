//
//  PlayPlaylistView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 2.07.2024.
//

import CircularSlider
import SwiftUI

struct PlayPlaylistView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var seekbarVal: Double = 0.5
    
    @State var allArr: NSArray = [
        [
            
            "image": "s1",
            "name": "Billie Jean",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s2",
            "name": "Be the girl",
            "artist": "Bebe Rexa"
        ],
        [
            "image": "s3",
            "name": "Countryman",
            "artist": "Daughtry"
        ],
        [
            "image": "s4",
            "name": "Do you feel lonelyness",
            "artist": "Marc Anthony"
        ],
        [
            "image": "s5",
            "name": "Earth song",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s6",
            "name": "Smooth criminal",
            "artist": "Michael Jackson"
        ],
        [
            "image": "s7",
            "name": "The way you make me feel",
            "artist": "Michael Jackson"
        ],
        
        [
            "image": "s9",
            "name": "Somebody that I used to know",
            "artist": "Gotye"
        ],
        [
            "image": "s10",
            "name": "Wild Thoughts",
            "artist": "Michael Jackson"
        ]
    ]
    
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    Text("Playlist")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.primaryText80)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Menu {
                        Button {
                        } label: {
                            Text("Social Share")
                                .foregroundStyle(Color.primaryText)
                        }
                        
                        Button {
                        } label: {
                            Text("Playing Queue")
                                .foregroundStyle(Color.primaryText)
                        }
                        
                        Button {
                        } label: {
                            Text("Add to playlist ...")
                                .foregroundStyle(Color.primaryText)
                        }
                        
                        Button {
                        } label: {
                            Text("Lyrics")
                                .foregroundStyle(Color.primaryText)
                        }
                        
                        Button {
                        } label: {
                            Text("Volume")
                                .foregroundStyle(Color.primaryText)
                        }
                        
                        Button {
                        } label: {
                            Text("Details")
                                .foregroundStyle(Color.primaryText)
                        }
                        
                        Button {
                        } label: {
                            Text("Sleep Timer")
                                .foregroundStyle(Color.primaryText)
                        }
                    } label: {
                        Image("more_btn")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .environment(\.colorScheme, .dark)
                }
                .padding(.top, .topInsets)
                .padding(.horizontal,20)
                
                
                ScrollView {
                    HStack(spacing: 25) {
                        Button {
                        } label: {
                            Image("previous_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Image("player_image")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .widthPer(per: 0.4), height: .widthPer(per: 0.4))
                                .cornerRadius(.widthPer(per: 0.2))
                                .clipped()
                            
                            CircularSlider(currentValue: $seekbarVal,
                                           minValue: 0.0,
                                           maxValue: 1.0,
                                           knobRadius: 10, knobColor: Color.focusStart,
                                           radius:  Double( CGFloat.widthPer(per: 0.2)),
                                           progressLineColor: Color.focusStart,
                                           textColor: .clear,
                                           currentValueSuffix: "")
                            .frame(width: .widthPer(per: 0.45), height: .widthPer(per: 0.45))
                        }
                        
                        Spacer()
                        
                        Button {
                        } label: {
                            Image("next_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 4)
                    
                    
                    Text("3:15 | 4.26")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.secondaryText)
                        .padding(.bottom, 15)
                    
                    Text("Black or White")
                        .font(.customfont(.medium, fontSize: 18))
                        .foregroundStyle(Color.primaryText.opacity(0.9))
                        .padding(.bottom, 4)
                    
                    Text("Michael Jackson • Album - Dangerous")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.primaryText60)
                        .padding(.bottom, 15)
                    
                    
                    LazyVStack(spacing: 10) {
                        ForEach(0..<allArr.count, id:\.self ) { index in
                            let sObj = allArr[index] as? NSDictionary ?? [:]
                            
                            NavigationLink {
                                //MainPlayerView()
                            } label: {
                                SongRow(sObj: sObj)
                            }
                        }
                    }
                    .padding(20)
                }
            }
        }
        .navigationTitle("")
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .background(Color.bg)
        .ignoresSafeArea()
    }
}

#Preview {
    PlayPlaylistView()
}
