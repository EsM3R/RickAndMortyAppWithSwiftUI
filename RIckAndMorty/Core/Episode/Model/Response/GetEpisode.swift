//
//  GetEpisode.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 23.05.2024.
//

import Foundation

struct GetEpisodeResponse : Codable , Hashable  {
    let id : Int
    let name : String
    let air_date : String
    let episode : String
}
