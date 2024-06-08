//
//  CharacterEpisodeCellView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 4.06.2024.
//

import SwiftUI


struct CharacterEpisodeCellView : View {
    
    @Bindable var viewModel : CharacterEpisodeCellViewModel
    
    
    var body: some View {
        VStack(alignment : .leading , spacing : 20){
            Group{
                Text("Episode \(viewModel.episode)")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(viewModel.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(viewModel.air_date)
                    .font(.headline)
             
            }
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(.leading)
        }
        .frame(width : 275 ,height: 150)
        .background(Color.gray.opacity(0.4))
        .background{
            RoundedRectangle(cornerRadius: 10)
                .stroke(.blue,lineWidth: 3)
        }
        .clipShape(.rect(cornerRadius: 10))
        


    }
}
