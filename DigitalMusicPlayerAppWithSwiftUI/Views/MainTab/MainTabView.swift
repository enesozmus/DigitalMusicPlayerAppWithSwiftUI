//
//  MainTabView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 29.06.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject private var vm: MainViewModel = MainViewModel.share
    
    var body: some View {
        ZStack {
            
            if(vm.selectTab == 0) {
                HomeView()
            } else if(vm.selectTab == 1) {
                SongsView()
            } else if(vm.selectTab == 2) {
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
                        isSelect: vm.selectTab == 0) {
                            vm.selectTab = 0
                        }
                    Spacer()
                    TabButton(
                        title: "Songs",
                        icon: "songs_tab",
                        iconUnfocus: "songs_tab_un",
                        isSelect: vm.selectTab == 1) {
                            vm.selectTab = 1
                        }
                    Spacer()
                    TabButton(
                        title: "Settings",
                        icon: "setting_tab",
                        iconUnfocus: "setting_tab_un",
                        isSelect: vm.selectTab == 2) {
                            vm.selectTab = 2
                        }
                    Spacer()
                }
                .padding(.top,  10)
                .padding(.bottom, .bottomInsets)
                .background(Color.bg)
                .shadow(radius: 5)
            }
            
            SideMenuView(isShowSideMenu: $vm.isShowSideMenu)
            
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
