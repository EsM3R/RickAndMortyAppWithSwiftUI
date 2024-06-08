//
//  EpisodeDetailView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 5.06.2024.
//

import SwiftUI

struct EpisodeDetailView: View {
     
    private var viewModel : EpisodeDetailViewViewModel
    
    init(viewModel: EpisodeDetailViewViewModel) {
        self.viewModel = viewModel
    }
    private let columns =
    [GridItem](repeating: GridItem(.flexible(),spacing: 10),count: 2)
    
    var body: some View {
        
        ScrollView {
            LazyVStack{
                EpisodeDetailInfoCells()
                EpisodeCharacterListView()

            }
            .padding(.horizontal ,5 )
        }
        .navigationTitle(viewModel.titleEpisode)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

extension EpisodeDetailView {
    
    @ViewBuilder
    func EpisodeDetailInfoCell(_ info : EpisodeDetailInfoCellViewModel ) -> some View {
        HStack{
            Text(info.type)
            Spacer()
            Text(info.value)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundStyle(Color.primary)
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.primary,lineWidth: 1)
        }
    }
    
    @ViewBuilder
    func EpisodeDetailInfoCells () -> some View {
        ForEach(viewModel.episodeDetailInfos) { info in
            EpisodeDetailInfoCell(info)
        }
    }
    
    @ViewBuilder
    func EpisodeCharacterListView() -> some View {
        
        let columns =
        [GridItem](repeating: GridItem(.flexible(),spacing: 10),count: 2)
        
        ScrollView {
            LazyVGrid(columns: columns,
                      spacing: 10,
                      content: {
                ForEach(viewModel.allCharacters ,id : \.self ) { urlString in
                    NavigationLink {
                        CharacterDetailScreen(urlString: urlString)
                    } label: {
                        let viewModel = CharacterCellViewModel(urlString: urlString)
                        CharacterCellView(viewModel: viewModel)
                    }
                    .tint(.primary)
                    
                }

            })
            
        }
    }
}

#Preview {
    ContentView()
}
