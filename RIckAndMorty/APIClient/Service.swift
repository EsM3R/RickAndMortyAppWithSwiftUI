//
//  Service.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    private init(){}

    func execute<T : Codable> (_ request : Request ,expecting type : T.Type ) async throws -> T {
    
        guard let url = request.url else {throw URLError(.badURL)}
      
        do{
            let (data , _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(type.self, from: data)
           
            return result
        }catch {
            throw error
        }
       
    }
}
