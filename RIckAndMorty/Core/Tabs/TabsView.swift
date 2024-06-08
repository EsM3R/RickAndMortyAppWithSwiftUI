//
//  TabsView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import SwiftUI

struct TabsView: View {
    
    private let character : TabsViewModel = .character
    private let locations : TabsViewModel = .locations
    private let episodes : TabsViewModel = .episodes
    private let settings : TabsViewModel = .settings
    
    var body: some View {
        
        TabView {
            CharacterView()
                .tabItem {
                    Label(character.title,
                          systemImage: character.systemImage)
                    .environment(\.symbolVariants , .none)
                }
                
            LocationView()
                .tabItem {
                    Label(locations.title,
                          systemImage: locations.systemImage )
                   
                }
           EpisodeView()
                .tabItem {
                    Label(episodes.title, 
                          systemImage: episodes.systemImage )
                        .environment(\.symbolVariants, .none)
                }
            
           SettingsView()
                .tabItem {
                    Label(settings.title, 
                          systemImage: settings.systemImage )
                }
        }
//        .tint(.black)
    
    }
}

#Preview {
    TabsView()
}
