//
//  CharacterDetaiViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 23.05.2024.
//

import Foundation
import UIKit

@Observable
class CharacterDetailViewModel {
    
    var urlString : String
    var characterInfos : [CharacterDetailCellViewViewModel] = []
    var image : UIImage? = nil
    var episodes : [String] = []
    var characterName : String = ""

    init(urlString: String) {
        self.urlString = urlString
        self.fetchCharacter()
    }
    
    func fetchCharacter() {
        
        guard let url = URL(string: self.urlString) else {return }
        guard let request = Request(url:url) else {return}
        
        Task{
        
            do{
                let response = try await Service.shared.execute(request, expecting: Character.self)
                self.characterName  = response.name
                self.episodes = response.episode
                self.getCharacterInfo(response)
                self.fetchImage(response.image)
            }catch {
                print(error.localizedDescription)
            }
        }
        
       
    }
    
 
    func fetchImage(_ image : String){
        Task {
            self.image = await ImageDownloadManager.shared.downloadImage(image)
        }
    }
    
    func getCharacterInfo(_ character : Character){
        
        self.characterInfos.append(contentsOf: [
            .init(type: .status, value: character.status.rawValue),
            .init(type: .gender, value: character.gender.rawValue),
            .init(type: .type, value: character.type),
            .init(type: .species, value: character.species),
            .init(type: .origin, value: character.origin.name ),
            .init(type: .location, value: character.location.name ),
            .init(type: .created, value: character.created),
            .init(type: .episodeCount, value: "\(character.episode.count)"),
            
        ])
    }
      
}
