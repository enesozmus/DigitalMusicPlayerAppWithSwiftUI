//
//  ArtistCell.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 2.07.2024.
//

import SwiftUI

struct ArtistCell: View {
    
    var aObj: NSDictionary =  [
        "image": "ar_1",
        "name": "Beyonce",
        "albums": "4 albums",
        "songs": "38 Songs"
    ]
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(aObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .overlay(
                    RoundedRectangle(cornerRadius: 1)
                        .stroke( Color.primaryText28, lineWidth: 1 ))
                .frame(width: 80, height: 80)
            
            
            VStack {
                Text(aObj.value(forKey: "name") as? String ?? "")
                    .font(.customfont(.bold, fontSize: 15))
                    .foregroundStyle(Color.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text("\(aObj.value(forKey: "albums") as? String ?? "" ) • \(aObj.value(forKey: "songs") as? String ?? "")")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.primaryText80)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
            Menu {
                Button {
                } label: {
                    Text("Play")
                        .foregroundStyle(Color.primaryText)
                }
                
                Button {
                } label: {
                    Text("Play next")
                        .foregroundStyle(Color.primaryText)
                }
                
                Button {
                } label: {
                    Text("Add to playlist queue")
                        .foregroundStyle(Color.primaryText)
                }
                
                
                Button {
                } label: {
                    Text("Add to playlist")
                        .foregroundStyle(Color.primaryText)
                }
                
                
                Button {
                } label: {
                    Text("Rename")
                        .foregroundStyle(Color.primaryText)
                }
                
                
                Button {
                } label: {
                    Text("Tag Editor")
                        .foregroundStyle(Color.primaryText)
                }
                
                
                Button {
                } label: {
                    Text("Go to artist")
                        .foregroundStyle(Color.primaryText)
                }
                
                Button {
                } label: {
                    Text("Delete form device")
                        .foregroundStyle(Color.primaryText)
                }
                
                Button {
                } label: {
                    Text("Share")
                        .foregroundStyle(Color.primaryText)
                }
                
            } label: {
                Image("more_btn")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .environment(\.colorScheme, .dark)
        }
    }
}


#Preview {
    ArtistCell()
        .padding(20)
        .background(Color.bg)
}
