//
//  EpisodeViewViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 5.06.2024.
//

import Foundation


@Observable
class EpisodeViewViewModel {
    
    var episodes : [Episode] = []
    
    private var responseInfo : GetAllEpisodesResponse.Info? = nil
    
    func fetchAllEpisodes() async  {
        
        let request : Request = Request(endpoint: .episode)
        
        do {
            
            let response = try await Service.shared.execute(request, expecting: GetAllEpisodesResponse.self)
            let results = response.results
            let info = response.info
            
            self.episodes = results
            self.responseInfo = info
            
        }catch {
            print(error.localizedDescription)
        }
    }

    private var shouldShowMoreEpisode : Bool {
        return responseInfo?.next != nil
    }
    
    func fetchMoreEpisodes() async {
        
        guard shouldShowMoreEpisode else {return}
        let urlString : String? = responseInfo?.next
        guard let urlString else {return }
        guard let url = URL(string: urlString) else {return}
        guard let request : Request = Request(url: url) else { return }
        
        
        do{
            let response = try await Service.shared.execute(request, expecting: GetAllEpisodesResponse.self)
            let results = response.results
            let info = response.info
            self.episodes.append(contentsOf: results)
            self.responseInfo = info
        }catch {
            print(error.localizedDescription)
        }
    }
}
