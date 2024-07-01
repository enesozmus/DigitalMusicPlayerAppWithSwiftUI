//
//  ScrollTabButton.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 30.06.2024.
//

import SwiftUI

struct ScrollTabButton: View {
    
    var title: String = "Title"
    var width: Double = 70
    var isSelect: Bool = true
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.customfont(.medium, fontSize: 15))
                .foregroundStyle(isSelect ? Color.focus : Color.primaryText28 )
        }
        .frame(width: width)
    }
}


#Preview {
    ScrollTabButton()
}
