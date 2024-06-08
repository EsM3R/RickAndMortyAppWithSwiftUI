//
//  CharacterEpisodeCellViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 23.05.2024.
//

import Foundation

@Observable
class CharacterEpisodeCellViewModel {
    
    private var urlString : String
    
    public var name : String = ""
    public var air_date : String = ""
    public var episode : String = ""
    
    init(urlString: String) {
        self.urlString = urlString
        self.fetchEpisode()
    }
    
    
    private var url : URL? {
        return URL(string: urlString)
    }
    
    private var request : Request? {
        guard let url = url else {return nil}
        return Request(url: url)
    }
    
    private func fetchEpisode(){
        guard let request = request else{ return }
        
        Task {
            do{
                let response  =  try await Service.shared.execute(request,
                                                                  expecting: GetEpisodeResponse.self)
                
                self.air_date = response.air_date
                self.episode = response.episode
                self.name =  response.name
                
            }catch{
                print(error.localizedDescription)
            }
        }
      
       
    }
    



}
