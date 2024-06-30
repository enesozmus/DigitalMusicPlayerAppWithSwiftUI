//
//  IconTextRow.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 30.06.2024.
//

import SwiftUI

struct IconTextRow: View {
    
    var title: String = "Title"
    var icon: String = "m_theme"
    
    var body: some View {
        VStack{
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25 , height: 25)
                
                Text(title)
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(Color.primaryText.opacity(0.9))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 40)
            
            Divider()
                .padding(.leading, 40)
        }
    }
}


#Preview {
    IconTextRow()
}
