//
//  GetAllCharacters.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import Foundation


struct GetAllCharactersResponse : Codable{
    
    struct Info : Codable{
        let count : Int?
        let pages : Int?
        let next  : String?
        let prev  : String?
    }
    
    let info : Info?
    let results : [Character]
    
    
}
