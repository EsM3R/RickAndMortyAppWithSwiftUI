//
//  LocationCellViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 11.06.2024.
//

import Foundation


class LocationCellViewModel {
    
    private let location : Location
    
    
    init(location: Location) {
        self.location = location
    }
    
    var name : String {
        location.name
    }
    
    var type : String {
        "Type : \(location.type)"
    }
    var dimension : String {
        "Dimension : \(location.dimension)"
    }
}

