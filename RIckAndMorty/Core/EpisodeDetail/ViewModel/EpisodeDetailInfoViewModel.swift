//
//  EpisodeDetailInfoViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 5.06.2024.
//

import Foundation

enum EpisodeDetailInfos  : String{
    case name = "Episode Name"
    case date = "Air Data"
    case episode
    case created
}

struct EpisodeDetailInfoCellViewModel : Identifiable , Hashable{
    
    internal let id : UUID = UUID()
    private var _type : EpisodeDetailInfos
    private var _value : String
    
    init(type: EpisodeDetailInfos, value: String) {
        self._type = type
        self._value = value
    }
    
    var type : String {
        _type.rawValue.capitalized
    }
    var value : String {
        _value.capitalized
    }
    
}
