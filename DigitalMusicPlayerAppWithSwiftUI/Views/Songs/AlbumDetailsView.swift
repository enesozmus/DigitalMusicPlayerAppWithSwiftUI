//
//  AlbumDetailsView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 1.07.2024.
//

import SwiftUI

struct AlbumDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var allArr: NSArray = [
        ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Earth Song", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"],
        ["duration": "3:56", "name": "Remember the Time","artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Earth Song", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"],
        ["duration": "3:56", "name": "Remember the Time","artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Earth Song", "artists": "Michael Jackson"],
        ["duration": "3:56", "name": "Mirror", "artists": "Justin Timberlake"],
        ["duration": "3:56", "name": "Remember the Time","artists": "Michael Jackson"]
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
                    
                    Text("Album Details")
                        .font(.customfont(.bold, fontSize: 18))
                        .foregroundStyle(Color.primaryText80)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("search")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.primaryText28)
                    }
                }
                .padding(.top, .topInsets)
                .padding(.horizontal,20)
                
                ScrollView {
                    ZStack{
                        Image("alb_1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: .screenWidth - 40, height: .screenWidth * 0.5)
                            .blur(radius: 5)
                            .clipped()
                        
                        Rectangle()
                            .fill(Color.black.opacity(0.54))
                        
                        VStack() {
                            HStack(alignment: .top,spacing: 15) {
                                Image("alb_1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                
                                VStack(spacing: 8) {
                                    Text("History")
                                        .font(.customfont(.bold, fontSize: 18))
                                        .foregroundStyle(Color.primaryText.opacity(0.9))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("by Michal Jackson")
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundStyle(Color.primaryText.opacity(0.74))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text("1996  .  18 Songs  .  64 min")
                                        .font(.customfont(.bold, fontSize: 12))
                                        .foregroundStyle(Color.primaryText.opacity(0.74))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image("play_n")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:12, height: 12)
                                    
                                    Text("Play")
                                        .font(.customfont(.medium, fontSize: 8))
                                        .foregroundStyle(Color.primaryText.opacity(0.74))
                                }
                                .padding(8)
                                .padding(.horizontal, 8)
                                .background(
                                    LinearGradient(colors: Color.primaryG, startPoint: .top, endPoint: .bottom)
                                )
                                .cornerRadius(15)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image("share")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:12, height: 12)
                                    
                                    Text("Share")
                                        .font(.customfont(.medium, fontSize: 8))
                                        .foregroundStyle(Color.primaryText.opacity(0.74))
                                }
                                .padding(8)
                                .padding(.horizontal, 15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke( Color.primaryText, lineWidth: 1 )
                                )
                                .cornerRadius(8)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image("favTemp")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:12, height: 12)
                                    
                                    Text("Add to Favorites")
                                        .font(.customfont(.medium, fontSize: 8))
                                    
                                }
                                .foregroundStyle(Color.primaryText.opacity(0.74))
                                .padding(8)
                                .padding(.horizontal, 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke( Color.primaryText, lineWidth: 1 )
                                )
                                .cornerRadius(15)
                                
                            }
                        }
                        .padding(20)
                    }
                    .frame(width: .screenWidth - 40)
                    
                    LazyVStack {
                        ForEach(0..<allArr.count , id: \.self) { index in
                            let sObj = allArr[index] as? NSDictionary ?? [:]
                            AlbumSongRow(sObj: sObj, isPlay: index == 0)
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
    AlbumDetailsView()
}
