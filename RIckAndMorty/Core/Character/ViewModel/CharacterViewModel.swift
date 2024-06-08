//
//  CharacterViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import Foundation


@Observable
class CharacterViewModel {
    
    var characters : [Character] = []

    private var responseInfo : GetAllCharactersResponse.Info? = nil
    
    public func fetchAllCharacters()async {
        let request = Request(endpoint: .character)
        do{
            let response = try await Service.shared.execute(request, expecting: GetAllCharactersResponse.self)
            let result = response.results
            let info = response.info
            self.responseInfo = info
            self.characters = result
            
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    public var shouldLoadMoreIndicator : Bool {
        return  responseInfo?.next != nil
    }
 

    public func fetchMoreCharacters() async{
    
        guard shouldLoadMoreIndicator else {return}
        let urlString : String = (responseInfo?.next)!
        
        guard let url = URL(string: urlString) else {return}
        guard let request = Request(url: url) else {return}
        
    
        do{
            let response = try await Service.shared.execute(request, expecting: GetAllCharactersResponse.self)
            let result = response.results
            let info = response.info
            self.responseInfo = info 
            self.characters.append(contentsOf: result)
        }catch {
            print(error.localizedDescription)
        }
        
        
        
      

    }
    
 
    
    
}
