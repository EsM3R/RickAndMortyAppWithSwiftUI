//
//  ImageDownloadManager.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 20.05.2024.
//

import Foundation
import UIKit


class ImageDownloadManager {
    
    static let shared =  ImageDownloadManager()
    
    private init (){}
    
//
//    func responseData(_ data : Data?) -> UIImage{
//        guard let data =  data else {return}
//
//    }
//
    func downloadImage(_ urlString : String) async -> UIImage?{
        
        
        guard let url = URL(string: urlString) else {return nil}
       
        do {
            let (data , _) = try  await URLSession.shared.data(from: url)
            
            guard let image = UIImage(data: data) else {throw URLError(.badServerResponse)}
            
            return image
        }
        catch {
            print(error.localizedDescription)
        }
     
        return nil 
    }
    
    
}
