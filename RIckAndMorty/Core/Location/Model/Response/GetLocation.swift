//
//  GetLocation.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 11.06.2024.
//

import Foundation


struct GetLocation : Identifiable , Codable{
    let id: Int
    let name : String
    let type : String
    let dimension: String
    let residents: [String]
    let created: String
}
