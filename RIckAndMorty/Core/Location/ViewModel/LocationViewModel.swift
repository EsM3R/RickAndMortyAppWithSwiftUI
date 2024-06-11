//
//  LocationViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 11.06.2024.
//

import Foundation


@Observable
class LocationViewModel {
    
    
    var locations : [ Location ] = []
    
    private var responseInfo : GetAllLocations.Info? = nil
    
    init(){
        fetchAllLocations()
    }
    
    func fetchAllLocations(){
        Task {
            do {
                let response =  try await Service.shared.execute(Request(endpoint: .location), expecting: GetAllLocations.self)
                self.locations.append(contentsOf: response.results)
            }catch {
                print(error.localizedDescription)
            }
            
            
            
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
            let response = try await Service.shared.execute(request, expecting: GetAllLocations.self)
            let results = response.results
            let info = response.info
            self.locations.append(contentsOf: results)
            self.responseInfo = info
        }catch {
            print(error.localizedDescription)
        }
    }
    
}
