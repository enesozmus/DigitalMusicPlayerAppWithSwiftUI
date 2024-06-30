//
//  MainTabView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 29.06.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectTab: Int = 0
    
    var body: some View {
        ZStack {
            
            if(selectTab == 0) {
                HomeView()
            } else if(selectTab == 1) {
                //SongsView()
                Text("SongsView")
                    .foregroundStyle(.white)
            } else if(selectTab == 2) {
                //SettingsView()
                Text("SettingsView")
                    .foregroundStyle(.white)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    TabButton(
                        title: "Home",
                        icon: "home_tab",
                        iconUnfocus: "home_tab_un",
                        isSelect: selectTab == 0) {
                            selectTab = 0
                        }
                    Spacer()
                    TabButton(
                        title: "Songs",
                        icon: "songs_tab",
                        iconUnfocus: "songs_tab_un",
                        isSelect: selectTab == 1) {
                            selectTab = 1
                        }
                    Spacer()
                    TabButton(
                        title: "Settings",
                        icon: "setting_tab",
                        iconUnfocus: "setting_tab_un",
                        isSelect: selectTab == 2) {
                            selectTab = 2
                        }
                    Spacer()
                }
                .padding(.top,  10)
                .padding(.bottom, .bottomInsets)
                .background(Color.bg)
                .shadow(radius: 5)
            }
        }
        .frame(width: .screenWidth, height: .screenHeight)
        .background(Color.bg)
        .navigationTitle("Digital Music Player")
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
