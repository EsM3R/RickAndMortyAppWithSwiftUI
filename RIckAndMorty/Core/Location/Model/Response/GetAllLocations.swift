//
//  GetAllLocations.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 11.06.2024.
//

import Foundation


struct GetAllLocations : Codable{
    
    struct Info : Codable{
        let count : Int?
        let pages : Int?
        let next  : String?
        let prev  : String?
    }
    
    let info : Info?
    let results : [Location]
    
    
}
