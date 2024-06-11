//
//  LocationDetailViewViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 11.06.2024.
//

import Foundation


@Observable
class LocationDetailViewViewModel {
    
    
    var locationDetailInfos : [LocationDetailInfoCellViewModel] =  []
    private var urlString : String
    var allResidents : [String] = []
    
    init(urlString : String ) {
        self.urlString = urlString
        self.fetchLocationDetail()
    }
    
    
    func fetchLocationDetail(){
        
        guard let url = URL(string: self.urlString) else {return }
        guard let request = Request(url: url ) else {return}
        Task{
            do{
                let response = try await Service.shared.execute(request, expecting: GetLocation.self)
                self.getLocationInfos(response)
                self.allResidents = response.residents
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getLocationInfos(_ response : GetLocation){
        
        self.locationDetailInfos.append(contentsOf: [
            .init(_type: .name, _value: response.name),
            .init(_type: .type, _value: response.type),
            .init(_type: .dimension, _value: response.dimension),
            .init(_type: .created, _value: response.created),
        ])
    }
    
}
