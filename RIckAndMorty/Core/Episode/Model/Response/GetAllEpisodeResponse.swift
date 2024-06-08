//
//  GetAllEpisodeResponse.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 5.06.2024.
//

import Foundation

struct GetAllEpisodesResponse : Codable {
    
    struct Info : Codable , Hashable{
        let count : Int?
        let pages : Int?
        let next  : String?
        let prev  : String?
    }
    
    let info : Info?
    let results : [Episode]

    
}


