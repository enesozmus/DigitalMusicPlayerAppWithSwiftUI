//
//  TabButton.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 29.06.2024.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Home"
    @State var icon: String = "home_tab"
    @State var iconUnfocus: String = "home_tab_un"
    var isSelect: Bool = false
    var didTap: (()->())?
    
    
    var body: some View {
        
        Button {
            didTap?()
        } label: {
            VStack {
                Image( isSelect ? icon : iconUnfocus)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                Text(title)
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundStyle(isSelect ? Color.focus : Color.unfocused )
            }
        }
        
    }
}

#Preview {
    TabButton()
}
