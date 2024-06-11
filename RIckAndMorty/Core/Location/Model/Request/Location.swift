//
//  Location.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import Foundation



struct Location : Identifiable , Codable , Hashable{
    let id: Int
    let name : String
    let type : String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
}
