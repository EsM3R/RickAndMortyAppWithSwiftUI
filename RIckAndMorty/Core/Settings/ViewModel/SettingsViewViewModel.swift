//
//  SettingsViewViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 8.06.2024.
//

import Foundation


@Observable
class SettingsViewViewModel {
    
    var settingCellsViewModel : [SettingsCellViewModel] = []
    
    init(){
        self.getAllSetting()
    }
    
    func getAllSetting(){
        SettingsOptions.allCases.forEach { settingCellsViewModel.append(SettingsCellViewModel(type: $0, onTapHandler: { option in
            
        }))}
    }
}
