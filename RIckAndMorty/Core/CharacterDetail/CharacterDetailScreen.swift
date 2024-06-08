//
//  CharacterDetailScreen.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 21.05.2024.
//

import SwiftUI

struct CharacterDetailScreen: View {
    
    private var viewModel : CharacterDetailViewModel
    
    private let columns : [GridItem] = [GridItem](repeating: GridItem(.flexible() ,spacing: 8), count: 2)
    
    init(urlString : String) {
        self.viewModel = CharacterDetailViewModel(urlString: urlString)
    }
   
    var body: some View {
        VStack {
            ScrollView {
                CharacterDetailViewImage()
                CharacterDetailCellViews()
                CharacterEpisodeCellViews()
        
            }
        }
        .padding([.horizontal , .bottom] , 5)
        .navigationTitle(viewModel.characterName)
        .navigationBarTitleDisplayMode(.inline)


        
    }
}
extension CharacterDetailScreen {
    @ViewBuilder
    func CharacterDetailCellViews() -> some View {
        LazyVGrid(columns: self.columns,spacing: 8 , content: {
            ForEach(viewModel.characterInfos) { viewModel in
                CharacterDetailCellView(viewModel: viewModel)
            }
        })
    }
    
    @ViewBuilder
    func CharacterEpisodeCellViews() -> some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing :12){
                ForEach(viewModel.episodes , id : \.self) { urlString in
                    
                    NavigationLink {
                        let viewModel = EpisodeDetailViewViewModel(urlString: urlString)
                        EpisodeDetailView(viewModel:viewModel )
                    } label: {
                        let viewModel = CharacterEpisodeCellViewModel(urlString: urlString)
                        CharacterEpisodeCellView(viewModel: viewModel )
                    }
                    .tint(Color.primary)
              
                }
            }
           
        }
        .scrollIndicators(.hidden)

    }
    
    @ViewBuilder
    func CharacterDetailViewImage() -> some View {
        if let uiImage = viewModel.image{
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(1.1, contentMode: .fit)
                .clipShape(.rect(cornerRadius: 8))
        }

    }
    
    
}



#Preview {
    TabsView()
}
