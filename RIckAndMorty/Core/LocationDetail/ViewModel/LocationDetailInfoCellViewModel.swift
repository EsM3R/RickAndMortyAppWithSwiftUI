//
//  LocationDetailInfoCellViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 11.06.2024.
//

import Foundation


enum LocationInfoType  : String {
    case name = "Location Name"
    case type
    case dimension
    case created
}

class LocationDetailInfoCellViewModel : Identifiable  {
    
    let id = UUID()

    private let _type : LocationInfoType
    private let _value : String
    
    
    init(_type: LocationInfoType, _value: String) {
        self._type = _type
        self._value = _value
    }
    var type : String {
        _type.rawValue.capitalized
    }
    var value : String {
        _value.capitalized
    }
    
}
