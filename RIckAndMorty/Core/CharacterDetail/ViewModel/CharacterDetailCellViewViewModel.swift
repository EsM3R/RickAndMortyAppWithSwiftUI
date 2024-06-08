//
//  CharacterDetailCellViewViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 23.05.2024.
//

import Foundation
import SwiftUI

enum CharacterDetailInfo : String{
    case status
    case gender
    case type
    case species
    case origin
    case location
    case created
    case episodeCount
    
    var displayTitle : String {
        
        switch self {
            
         case .status,
         .gender,
         .type,
         .species,
         .origin,
         .location,
         .created : rawValue.uppercased()
        case .episodeCount: "Episode Count"
        }
    }
    var systemImage : String {
        
        switch self {
            
        case .status: "bell"
        case .gender: "bell"
        case .type: "bell"
        case .species:  "bell"
        case .origin: "bell"
        case .location: "bell"
        case .created: "bell"
        case .episodeCount: "bell"
        }
    }
    var tintColor : Color {
        
        switch self {
            
        case .status: .blue
        case .gender: .red
        case .type: .purple
        case .species: .green
        case .origin: .orange
        case .location: .pink
        case .created: .yellow
        case .episodeCount: .mint
        }
    }
    
    
}

struct CharacterDetailCellViewViewModel : Identifiable,Hashable{
    internal let id = UUID()
    private let type : CharacterDetailInfo
    private let value : String
    
    init(type: CharacterDetailInfo, value: String) {
        self.type = type
        self.value = value
    }
    
    public var title : String {
        type.displayTitle
    }
    public var displayValue :  String {
        if value.isEmpty {return "None"}
        return value
    }
    public var systemImage : String {
        type.systemImage
    }
    public var tintColor : Color {
        type.tintColor
    }
}
