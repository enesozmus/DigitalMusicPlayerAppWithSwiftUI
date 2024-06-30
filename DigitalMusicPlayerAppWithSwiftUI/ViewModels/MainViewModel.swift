//
//  MainViewModel.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 30.06.2024.
//

import Foundation
import SwiftUI


class MainViewModel: ObservableObject {
    static var share : MainViewModel = MainViewModel()
    
    @Published var selectTab: Int = 0
    @Published var isShowSideMenu: Bool = false
}
