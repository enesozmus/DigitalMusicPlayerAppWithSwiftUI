//
//  PlayerBottomButton.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 2.07.2024.
//

import SwiftUI

struct PlayerBottomButton: View {
    
    var title: String = "Playlist"
    var icon: String = "playlist"
    
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundStyle(Color.primaryText)
            
            Text(title)
                .font(.customfont(.regular, fontSize: 10))
                .foregroundStyle(Color.secondaryText)
        }
    }
}

#Preview {
    PlayerBottomButton()
        .padding(20)
        .background(Color.bg)
}
