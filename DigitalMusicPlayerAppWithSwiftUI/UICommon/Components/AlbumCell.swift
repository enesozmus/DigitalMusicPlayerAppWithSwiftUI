//
//  AlbumCell.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 1.07.2024.
//

import SwiftUI

struct AlbumCell: View {
    
    var sObj: NSDictionary =   [
        "image": "alb_1",
        "name": "History",
        "artists": "Michael Jackson",
        "songs": "10 Songs"
    ]
    
    var body: some View {
        VStack {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .aspectRatio( CGSize(width: 1, height: 1) , contentMode: .fit)
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 4) {
                HStack {
                    Text(sObj.value(forKey: "name") as? String ?? "")
                        .font(.customfont(.medium, fontSize: 14))
                        .foregroundStyle(Color.primaryText)
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
                            .frame(width: 12, height: 12)
                    }
                    .environment(\.colorScheme, .dark)
                }
            }
            
            HStack {
                Text(sObj.value(forKey: "artists") as? String ?? "")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.primaryText28)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text("•")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.primaryText28)
                
                Text(sObj.value(forKey: "songs") as? String ?? "")
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.primaryText28)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
    }
}


#Preview {
    AlbumCell()
        .background(Color.bg)
        .frame(width: 200)
}
