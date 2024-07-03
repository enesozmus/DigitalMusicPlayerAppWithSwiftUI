//
//  MainPlayerView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 2.07.2024.
//

import CircularSlider
import SDWebImageSwiftUI
import SwiftUI

struct MainPlayerView: View {
    
    @StateObject var vm = AudioPlayerViewModel.shared
    @Environment(\.dismiss) var dismiss
    @State var seekbarVal: Double = 0.5
    
    
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
                    
                    Text("Now Playing")
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
                        
                        NavigationLink {
                            DriverModeView()
                        } label: {
                            Text("Driver Mode")
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
                    ZStack {
                        let _ = print(vm.artwork)
                        
                        WebImage( url: URL(string: vm.artwork))
                            .resizable()
                            .indicator(.activity)
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: .widthPer(per: 0.6), height: .widthPer(per: 0.6))
                            .cornerRadius(.widthPer(per: 0.3))
                            .clipped()
                        
                        CircularSlider(currentValue: $vm.sliderValue,
                                       minValue: 0.0,
                                       maxValue: vm.sliderMaximumValue,
                                       knobRadius: 10, knobColor: Color.focusStart,
                                       radius:  Double( CGFloat.widthPer(per: 0.3)),
                                       progressLineColor: Color.focusStart,
                                       textColor: .clear,
                                       currentValueSuffix: ""
                        )
                        .padding(20)
                    }
                    .padding(.bottom, 4)
                    
                    ProgressSliderView(value: $vm.sliderValue,
                                       maximumValue: $vm.sliderMaximumValue,
                                       isUserInteractionEnabled: $vm.sliderIsUserInteractionEnabled,
                                       playableProgress: $vm.sliderPlayableProgress) {
                        vm.sliderValueChanged.send($0
                        )
                    }
                                       .padding(.horizontal)
                    
                    
                    Text("\(vm.duration) | -\(vm.restDuration)")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.secondaryText)
                        .padding(.bottom, 15)
                    
                    Text(vm.title)
                        .font(.customfont(.medium, fontSize: 18))
                        .foregroundStyle(Color.primaryText.opacity(0.9))
                        .padding(.bottom, 4)
                    
                    Text("\( vm.artist )")
                        .font(.customfont(.regular, fontSize: 14))
                        .foregroundStyle(Color.secondaryText)
                        .padding(.bottom, 15)
                    
                    Image("eq_display")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 70)
                    
                    Divider()
                        .padding(20)
                    
                    HStack(spacing: 25) {
                        Button {
                            vm.playPrevious()
                        } label: {
                            Image("previous_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .disabled(!vm.canPlayPrevious)
                        
                        Button {
                            vm.canPlay ? vm.play() : vm.pause()
                        } label: {
                            Image( vm.canPlay ? "play" : "pause" )
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        
                        Button {
                            vm.playNext()
                        } label: {
                            Image("next_song")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                        .disabled(!vm.canPlayNext)
                    }
                    
                    HStack(spacing: 25) {
                        NavigationLink {
                            PlayPlaylistView()
                        } label: {
                            PlayerBottomButton(title: "Playlist", icon: "playlist")
                        }
                        
                        Button {
                            vm.shuffle()
                        } label: {
                            PlayerBottomButton(title: "Shuffle", icon: "shuffle")
                        }
                        
                        Button {
                            vm.doRepeat()
                        } label: {
                            PlayerBottomButton(title: "Repeat", icon: "repeat")
                        }
                        
                        Button {
                        } label: {
                            PlayerBottomButton(title: "EQ", icon: "eq")
                        }
                        
                        Button {
                        } label: {
                            PlayerBottomButton(title: "Favourites", icon: "favTemp")
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
    NavigationStack {
        MainPlayerView()
    }
}
