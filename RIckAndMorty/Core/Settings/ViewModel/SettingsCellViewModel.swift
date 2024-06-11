//
//  SettingsCellViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 8.06.2024.
//

import SwiftUI


class SettingsCellViewModel : Identifiable {
    
    let id = UUID()
    
    public let type : SettingsOptions
    public let onTapHandler : (SettingsOptions) -> Void
    
    init(type: SettingsOptions, onTapHandler: @escaping (SettingsOptions) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
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
