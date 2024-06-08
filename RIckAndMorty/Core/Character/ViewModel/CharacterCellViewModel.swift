//
//  CharacterCellViewModel.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 21.05.2024.
//

import Foundation
import UIKit

@Observable
class CharacterCellViewModel {
    
    private var _urlString : String
    private var _name : String = ""
    private var _status : String = ""
    var image : UIImage? = nil
    
    init(urlString: String) {
        self._urlString = urlString
        self.fetchCharacter()
    }
    
    var name : String {
        get{
            return _name
        }
    }
    var status : String {
        get{
            return "Status :\(_status)"
        }
        
    }
    
    func fetchCharacter() {
        
        guard let url = URL(string: _urlString) else {return}
        guard let request = Request(url: url)  else {return}
        
        Task {
            do {
                let response = try await Service.shared.execute(request, expecting: Character.self)
                self._status = response.status.rawValue
                self._name = response.name
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
}
