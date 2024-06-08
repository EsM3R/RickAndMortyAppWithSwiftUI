//
//  SettingsOptions.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 8.06.2024.
//

import SwiftUI


enum SettingsOptions : CaseIterable {

    case rateApp
    case contactUs
    case terms
    case privacy
    case apiReferance
    case viewSeries
    case viewCode
    
    
    var displayTitle : String {
        
        switch self{
            
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy of Policy"
        case .apiReferance:
            return "API Reference"
        case .viewSeries:
            return "View Video Series"
        case .viewCode:
            return "View App Code"
        }
    }
    
    var systemImage : String {
        switch self{
            
        case .rateApp:
            return "star.fill"
        case .contactUs:
            return "phone"
        case .terms:
            return "doc"
        case .privacy:
            return "lock"
        case .apiReferance:
            return "list.clipboard"
        case .viewSeries:
            return "tv.fill"
        case .viewCode:
            return "hammer.fill"
        }
    }
    
    var systemImageContainerColor : Color {
        switch self{
            
        case .rateApp:
            return .red
        case .contactUs:
            return .blue
        case .terms:
            return .yellow
        case .privacy:
            return .orange
        case .apiReferance:
            return .purple
        case .viewSeries:
            return .pink
        case .viewCode:
            return .cyan
        }
    }
}
