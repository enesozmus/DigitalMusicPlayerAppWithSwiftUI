//
//  SettingRow.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 3.07.2024.
//

import SwiftUI

struct SettingRow: View {
    
    var title: String = "Title"
    var icon: String = "s_display"
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.customfont(.medium, fontSize: 14))
                    .foregroundStyle(Color.primaryText.opacity(0.9))
                    .frame(maxWidth: .infinity, alignment: .leading )
            }
            Divider()
                .padding(.leading, 40)
        }
        .frame(height: 44)
    }
}

#Preview {
    SettingRow()
        .padding(20)
        .background(Color.bg)
}
