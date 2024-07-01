//
//  SongRow.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 1.07.2024.
//

import SwiftUI

struct SongRow: View {
    
    var sObj: NSDictionary = [
        "name":"Title",
        "artist":"Artist Name",
        "image":"s1"
    ]
    var didTap: (()->())?
    var didTapPlay: (()->())?
    
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                ZStack(alignment: .center) {
                    Image( sObj.value(forKey: "image") as? String ?? "")
                        .resizable()
                        .scaledToFill()
                        .overlay(
                            RoundedRectangle(cornerRadius:  25)
                                .stroke(Color.primaryText28, lineWidth: 1)
                        )
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                    
                    Rectangle()
                        .fill(Color.bg)
                        .frame(width: 15, height: 15)
                        .cornerRadius(7.5)
                }
                
                VStack {
                    Text(sObj.value(forKey: "name") as? String ?? "")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color.primaryText.opacity(0.9))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(sObj.value(forKey: "artist") as? String ?? "")
                        .font(.customfont(.regular, fontSize: 10))
                        .foregroundStyle(Color.primaryText28)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Button {
                    didTapPlay?()
                } label: {
                    Image( "play_btn")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
            
            Divider()
                .padding(.leading, 50)
        }
    }
}

#Preview {
    SongRow()
        .padding(20)
        .background(Color.bg)
}
