//
//  ArtistAlbumCell.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 2.07.2024.
//

import SwiftUI

struct ArtistAlbumCell: View {
    
    @State var sObj: NSDictionary = [:]
    
    var body: some View {
        VStack {
            Image(sObj.value(forKey: "image") as? String ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 80)
                .padding(.bottom, 4)
                .clipped()
            
            Text(sObj.value(forKey: "name") as? String ?? "")
                .font(.customfont(.bold, fontSize: 13))
                .foregroundStyle(Color.primaryText60)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text(sObj.value(forKey: "year") as? String ?? "")
                .font(.customfont(.bold, fontSize: 10))
                .foregroundStyle(Color.secondaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .frame(width: 90)
    }
}

#Preview {
    ArtistAlbumCell(sObj: [
        "image":"ar_d_1",
        "name":"Fire Dragon",
        "year":"2019",
    ])
    .padding(80)
    .background(Color.bg)
}
