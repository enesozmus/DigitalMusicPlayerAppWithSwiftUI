//
//  DigitalMusicPlayerAppWithSwiftUIApp.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 29.06.2024.
//

import SwiftUI

@main
struct DigitalMusicPlayerAppWithSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainTabView()
            }
            .navigationViewStyle(.stack)
        }
    }
}
