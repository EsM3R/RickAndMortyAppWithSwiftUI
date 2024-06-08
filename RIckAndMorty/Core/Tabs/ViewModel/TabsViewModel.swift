//
//  TabsViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import Foundation


enum TabsViewModel : Int, CaseIterable{
    
    case character
    case locations
    case episodes
    case settings
    
    var title : String {
        
        switch self {
            
        case .character: "Charcters"
        case .locations: "Locations"
        case .episodes: "Episodes"
        case .settings: "Settings"
            
        }
    }
    
    var systemImage : String {
        
        switch self {
            
        case .character: "person"
        case .locations: "globe"
        case .episodes: "tv"
        case .settings: "gear"
            
        }
    }
}


