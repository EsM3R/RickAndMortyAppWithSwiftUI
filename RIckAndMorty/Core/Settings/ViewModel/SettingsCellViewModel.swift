//
//  SettingsCellViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 8.06.2024.
//

import SwiftUI


class SettingsCellViewModel : Identifiable {
    
    let id = UUID()
    
    private let type : SettingsOptions
    
    init(type: SettingsOptions) {
        self.type = type
    }
    
    var title : String {
        type.displayTitle
    }
    var systemImage : String {
        type.systemImage
    }
    var backgroundColor : Color{
        type.systemImageContainerColor
    }
}
