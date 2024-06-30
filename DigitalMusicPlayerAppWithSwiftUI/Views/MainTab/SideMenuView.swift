//
//  SideMenuView.swift
//  DigitalMusicPlayerAppWithSwiftUI
//
//  Created by enesozmus on 30.06.2024.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var isShowSideMenu: Bool
    
    var edgeTransition: AnyTransition = .move(edge: .leading)
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            if(isShowSideMenu) {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowSideMenu.toggle()
                    }
                
                HStack {
                    ScrollView{
                        VStack {
                            
                            Spacer()
                            
                            Image("app_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: .screenWidth * 0.17 , height: .screenWidth * 0.30)
                            
                            HStack{
                                Spacer()
                                VStack{
                                    Text("328\nSongs")
                                        .multilineTextAlignment(.center)
                                        .font(.customfont(.regular, fontSize: 12))
                                        .foregroundStyle( Color(hex: "C1C0C0") )
                                }
                                Spacer()
                                VStack{
                                    Text("52\nAlbums")
                                        .multilineTextAlignment(.center)
                                        .font(.customfont(.regular, fontSize: 12))
                                        .foregroundStyle( Color(hex: "C1C0C0") )
                                }
                                Spacer()
                                VStack{
                                    Text("87\nArtists")
                                        .multilineTextAlignment(.center)
                                        .font(.customfont(.regular, fontSize: 12))
                                        .foregroundStyle( Color(hex: "C1C0C0") )
                                }
                                Spacer()
                            }
                            
                            Spacer()
                            
                        }
                        .frame(height: 240)
                        .background(Color.primaryText.opacity(0.03))
                        
                        LazyVStack{
                            IconTextRow(title: "Themes", icon: "m_theme")
                            IconTextRow(title: "Ringtone Cutter", icon: "m_ring_cut")
                            IconTextRow(title: "Sleep Timer", icon: "m_sleep_timer")
                            IconTextRow(title: "Equalizer", icon: "m_eq")
                            IconTextRow(title: "Driver Mode", icon: "m_driver_mode")
                            IconTextRow(title: "Hidden Folders", icon: "m_hidden_folder")
                        }
                        .padding(15)
                    }
                    
                    .frame(width: .screenWidth * 0.7 )
                    .background(Color.bg)
                    .transition(edgeTransition)
                    .background(Color.clear)
                    Spacer()
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom )
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowSideMenu)
    }
}


#Preview {
    SideMenuView(isShowSideMenu: .constant(false))
}
