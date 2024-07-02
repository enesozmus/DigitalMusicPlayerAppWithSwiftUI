//
//  AlbumSongRow.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 1.07.2024.
//

import SwiftUI

struct AlbumSongRow: View {
    
    @State var sObj: NSDictionary = [:]
    var isPlay: Bool = false
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button {
                } label: {
                    Image( "play_btn")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                
                Text(sObj.value(forKey: "name") as? String ?? "")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(Color.primaryText60)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(sObj.value(forKey: "duration") as? String ?? "")
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(Color.primaryText60)
                
                if(isPlay) {
                    Image("play_eq")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 40, alignment: .center)
                }else{
                    Button {
                    } label: {
                        Image( "more")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 80, height: 40, alignment: .trailing)
                }
            }
            
            Divider()
                .padding(.leading, 50)
        }
        .frame(height: 44)
    }
}

#Preview {
    AlbumSongRow(sObj: ["duration": "3:56", "name": "Billie Jean", "artists": "Michael Jackson"])
        .padding(.horizontal, 20)
        .background(Color.bg)
}
