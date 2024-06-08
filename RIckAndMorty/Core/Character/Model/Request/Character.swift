//
//  Characte.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import Foundation

struct Character : Identifiable , Codable , Hashable{
  
    let id: Int
    let name : String
    let status : CharacterStatus
    let species : String
    let type: String
    let gender: CharacterGender
    let origin : Origin
    let location: SingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
}
enum CharacterGender : String , Codable ,Hashable{
    
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}
enum CharacterStatus : String , Codable , Hashable{

    case alive = "Alive"
    case dead =  "Dead"
    case unknown = "unknown"
}

struct Origin : Codable , Hashable{
    
    let name: String
    let url: String
}

struct SingleLocation : Codable , Hashable{
    
    let name: String
    let url: String
    
}
