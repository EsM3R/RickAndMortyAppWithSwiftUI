//
//  CharacterDetailCellView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 4.06.2024.
//

import SwiftUI

struct CharacterDetailCellView : View{
    
    let viewModel : CharacterDetailCellViewViewModel
    
    var body: some View{
        VStack{
            HStack(alignment : .center){
                Group{
                    
                    Image(systemName: viewModel.systemImage)
                        .foregroundStyle(viewModel.tintColor)
                        .padding(.leading,10)
                        
                    
    
                    Text("\(viewModel.displayValue)")
                        .font(.title3)
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                }
                .font(.title)
                
             
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .frame(height: 100)
            .background(Color.gray.opacity(0.3))
            .clipShape(.rect(cornerRadius: 10))
            .background(RoundedRectangle(cornerRadius: 10).stroke(viewModel.tintColor, lineWidth: 2))
            Text("\(viewModel.title)")
                .font(.title2)
                .foregroundStyle(viewModel.tintColor)
            
        }
    }
}
