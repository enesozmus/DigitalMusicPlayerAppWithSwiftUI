//
//  HomeView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 29.06.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var vm: MainViewModel = MainViewModel.share
    
    @State private var txtSearch: String = ""
    @State var hostRecommendedArr = [
        [
            "image": "img_1",
            "name": "Sound of Sky",
            "artists": "Dilon Bruce"
        ],
        [
            "image": "img_2",
            "name": "Girl on Fire",
            "artists": "Alecia Keys"
        ],
        [
            "image": "img_1",
            "name": "Sound of Sky",
            "artists": "Dilon Bruce"
        ],
        [
            "image": "img_2",
            "name": "Girl on Fire",
            "artists": "Alecia Keys"
        ]
    ]
    
    @State var playlistArr = [
        [
            "image": "img_3",
            "name": "Classic Playlist",
            "artists": "Piano Guys"
        ],
        [
            "image": "img_4",
            "name": "Summer Playlist",
            "artists": "Dilon Bruce"
        ],
        [
            "image": "img_5",
            "name": "Pop Music",
            "artists": "Michael Jackson"
        ],
        [
            "image": "img_3",
            "name": "Classic Playlist",
            "artists": "Piano Guys"
        ],
        [
            "image": "img_4",
            "name": "Summer Playlist",
            "artists": "Dilon Bruce"
        ],
        [
            "image": "img_5",
            "name": "Pop Music",
            "artists": "Michael Jackson"
        ]
    ]
    
    var recentlyPlayedArr: NSArray = [
        [
            "rate": 4,
            "name": "Billie Jean",
            "artists": "Michael Jackson"
        ],
        [
            "rate": 4,
            "name": "Earth Song",
            "artists": "Michael Jackson"
        ],
        [
            "rate": 4,
            "name": "Mirror",
            "artists": "Justin Timberlake"
        ],
        [
            "rate": 4,
            "name": "Remember the Time",
            "artists": "Michael Jackson"
        ]
    ]
    
    var body: some View {
        ZStack {
            ScrollView {
                /// Hot Recommended - Horizontal ScrollView
                ///
                ///
                hotRecommendedView
                
                /// Playlists -- View All
                ///
                ///
                playlistsView
                
                /// Playlist - Horizontal ScrollView
                ///
                ///
                playlistHorizontalScrollView
                
                /// Recently Played -- View All
                ///
                ///
                recentlyPlayedView
                
                /// Recently Played - Lazy Vertical Stack
                ///
                ///
                recentlyPlayedLazyVerticalStackView
            }
            
            /// Open Menu and Search Bar
            ///
            ///
            openMenuAndSearchBarView
        }
        .frame(width: .screenWidth, height: .screenHeight)
        .background(Color.bg)
        .navigationTitle("Digital Music Player")
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .navigationBar)
        .ignoresSafeArea()
    }
}


// MARK: Extension
extension HomeView {
    // ... 🔵
    private var hotRecommendedView: some View {
        VStack {
            Text("Hot Recommended")
                .font(.customfont(.medium, fontSize: 15))
                .foregroundStyle(Color.primaryText80)
                .padding(.top,  .topInsets + 56)
                .padding(.horizontal, 20)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(hostRecommendedArr.indices, id: \.self) { index in
                        let sObj = hostRecommendedArr[index]
                        VStack {
                            Image(sObj["image"] ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 230, height: 125)
                                .padding(.bottom, 4)
                            Text(sObj["name"] ?? "")
                                .font(.customfont(.bold, fontSize: 13))
                                .foregroundStyle(Color.primaryText60)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            Text(sObj["artists"] ?? "")
                                .font(.customfont(.bold, fontSize: 10))
                                .foregroundStyle(Color.secondaryText)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
    // ... 🔵
    private var playlistsView: some View {
        ViewAllSection(title: "Playlists") {
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
    // ... 🔵
    private var playlistHorizontalScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                ForEach(playlistArr.indices, id: \.self) { index in
                    let sObj = playlistArr[index]
                    VStack {
                        Image(sObj["image"] ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .padding(.bottom, 4)
                        
                        Text(sObj["name"] ?? "")
                            .font(.customfont(.bold, fontSize: 13))
                            .foregroundStyle(Color.primaryText60)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text(sObj["artists"] ?? "")
                            .font(.customfont(.bold, fontSize: 10))
                            .foregroundStyle(Color.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    // ... 🔵
    private var recentlyPlayedView: some View {
        ViewAllSection(title: "Recently Played") {
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
    // ... 🔵
    private var recentlyPlayedLazyVerticalStackView: some View {
        LazyVStack(spacing: 10) {
            ForEach(0..<recentlyPlayedArr.count, id: \.self) { index in
                let sObj = recentlyPlayedArr[index] as? [String:Any] ?? [:]
                
                HStack {
                    Button {
                        
                    } label: {
                        Image("play_btn")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    
                    VStack {
                        Text(sObj["name"] as? String ?? "")
                            .font(.customfont(.bold, fontSize: 13))
                            .foregroundStyle(Color.primaryText60)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text(sObj["artists"]  as? String ?? "")
                            .font(.customfont(.bold, fontSize: 10))
                            .foregroundStyle(Color.secondaryText)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    
                    VStack {
                        Image("fav")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                        HStack(spacing: 2) {
                            ForEach( 1...5, id: \.self ) { index in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(Color.org)
                            }
                        }
                    }
                }
                Divider()
                    .padding(.leading, 60)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
        
    }
    // ... 🔵
    private var openMenuAndSearchBarView: some View {
        VStack {
            HStack(spacing: 15) {
                Button {
                    vm.isShowSideMenu = true
                } label: {
                    Image("menu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                HStack {
                    Image("search")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.primaryText28)
                    TextField("Search Album Songs", text: $txtSearch)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundStyle(Color.primaryText)
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background( Color(hex: "292E4B") )
                .cornerRadius(30)
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            
            Spacer()
        }
    }
    
}


// MARK: Preview
#Preview {
    HomeView()
}
