//
//  EpisodeDetailViewViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 5.06.2024.
//

import Foundation

@Observable
class EpisodeDetailViewViewModel {
    
    var episodeDetailInfos : [EpisodeDetailInfoCellViewModel] =  []
    
    private var urlString : String
    var titleEpisode : String = ""
    var allCharacters : [String ] = []
    init(urlString: String) {
        self.urlString = urlString
        print(urlString)
        self.fetchEpisodeDetails()
    }
    
    
    func fetchEpisodeDetails() {
        
        guard let url = URL(string: urlString) else { return }
        
        guard let request = Request(url: url) else { return }
        
        
        Task {
            do {
                let response = try await Service.shared.execute(request, expecting: Episode.self)
                self.titleEpisode = response.episode
                self.getEpisodeInfo(response)
                self.allCharacters = response.characters
            }
            catch{
                print(error.localizedDescription)
            }
           
        }
       
    }
    func getEpisodeInfo(_ response : Episode ){
        self .episodeDetailInfos.append(contentsOf:
        [
            .init(type:.name, value: response.name),
            .init(type:.date, value: response.air_date),
            .init(type:.episode, value: response.episode),
            .init(type:.created, value: response.created),
        
        ])

    }
}
