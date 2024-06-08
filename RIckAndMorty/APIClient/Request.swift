//
//  Request.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import Foundation

final class Request {
    
    private struct Constants {
        static let baseURL : String = "https://rickandmortyapi.com/api"
    }
    
    public let httpMethod = "GET"
    
    let endpoint : Endpoint
    
    let pathComponents : [String]
    
    let queryParameters : [URLQueryItem]
    
    private var urlString : String {
        
        var string : String = Constants.baseURL
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            string += "/"
            pathComponents.forEach {
                string += "\($0)"
                if $0 != pathComponents.last {
                    string += ","
                }
            }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argument = queryParameters.compactMap ({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argument
        }
     
        
        return string
    }
     
    public var url : URL? {
        return URL(string: urlString)
    }
    
    init(endpoint: Endpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url : URL) {
        let string = url.absoluteString
        
        if !string.contains(Constants.baseURL){
            
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constants.baseURL+"/", with: "")
        if trimmed.contains("/"){
            let components = trimmed.components(separatedBy: "/")
            
            if !components.isEmpty{
                
                let endpointString = components[0]
                let pathComponents = components[1]
                
                if let endpoint = Endpoint(rawValue: endpointString) {
                    self.init(endpoint: endpoint,pathComponents: [pathComponents])
                    return
                }
            }
        }else if trimmed.contains("?"){
           
            let components = trimmed.components(separatedBy: "?")
           
            if !components.isEmpty , components.count >= 2{
                let endpointString = components[0]
                let queryItemsString = components[1]
               
                let queryItems : [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap ({
                    guard $0.contains("=") else {return nil}
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(name: parts[0],
                                        value: parts[1])
                })
                if let endpoint = Endpoint(rawValue: endpointString) {
                    self.init(endpoint: endpoint ,queryParameters: queryItems)
                    return
                }
            }
        }
        
        return nil
    }
}
