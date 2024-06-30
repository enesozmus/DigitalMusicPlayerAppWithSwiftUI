//
//  ViewAllSection.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 30.06.2024.
//

import SwiftUI

struct ViewAllSection: View {
    
    @State var title: String =  "Title"
    @State var button: String = "View All"
    var didTap: (()->())?
    
    var body: some View {
        HStack{
            Text(title)
                .font(.customfont(.medium, fontSize: 15))
                .foregroundStyle(Color.primaryText80)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Button {
                didTap?()
            } label: {
                Text(button)
                    .font(.customfont(.regular, fontSize: 11))
                    .foregroundStyle(Color.org)
            }
        }
    }
}

#Preview {
    ViewAllSection()
}
