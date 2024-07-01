//
//  PlaylistSongCell.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 1.07.2024.
//

import SwiftUI

struct PlaylistSongCell: View {
    
    var sObj: NSDictionary =  [
        "image":"playlist_1",
        "name":"My Top Tracks",
        "songs":"100 Songs"
    ]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
            
            Rectangle()
                .fill(.black.opacity(0.45))
            
            HStack {
                VStack {
                    Text(sObj.value(forKey: "name") as? String ?? "")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text(sObj.value(forKey: "songs") as? String ?? "")
                        .font(.customfont(.regular, fontSize: 10))
                        .foregroundStyle(Color.primaryText28)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Button {
                } label: {
                    Image("play")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                }
            }
            .padding(15)
        }
        .aspectRatio(CGSize(width: 200, height: 140), contentMode: .fit)
    }
}


#Preview {
    PlaylistSongCell()
        .frame(width: 200)
}
