//
//  EpisodeView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import SwiftUI

struct EpisodeView: View {

    @State private var viewModel : EpisodeViewViewModel = EpisodeViewViewModel()

    var body: some View {
        NavigationStack{
            VStack{
                if viewModel.episodes.isEmpty {
                    FailureScreen()
                }else {
                    SuccessScreen()
                }
            }
            .padding(.horizontal ,5)
            .navigationTitle("Episodes")
            .background(Color(uiColor: UIColor.systemBackground))
            .navigationDestination(for: String.self, destination: { urlString in
                let viewModel = EpisodeDetailViewViewModel(urlString: urlString)
                EpisodeDetailView(viewModel: viewModel)
            
            })
            .task{
                await viewModel.fetchAllEpisodes()
            }
            
        }
        
    }
}

extension EpisodeView {
    
    
    @ViewBuilder
    func FailureScreen() -> some View {
        ProgressView()
            .scaleEffect(1.5)
    }
    
    @ViewBuilder
    func SuccessScreen() -> some View {
        ScrollView {
            LazyVStack{
                EpisodeCellsView()
                fetchMoreEpisodes()
            }
        }
    }
    @ViewBuilder
    func fetchMoreEpisodes() -> some View {
        ProgressView()
            .scaleEffect(1.5)
            .padding()
            .onAppear{
                Task {
                    try await Task.sleep(nanoseconds: 1_500_000_000)
                    await viewModel.fetchMoreEpisodes()
                }
            }

    }
    
    
    @ViewBuilder
    func EpisodeCellsView() -> some View {
        ForEach(viewModel.episodes){ episode in
            
            NavigationLink(value: episode.url) {
                EpisodeCellView(episode)
            }
            .tint(Color.primary)
            
        }
    }
    
    @ViewBuilder
    func EpisodeCellView(_ episode : Episode) -> some View {
        
        
        let colors : [Color] = [.blue ,.purple ,.red ,.green,.orange,.pink,.yellow ,
                .mint]
        VStack(spacing : 20){
            Group{
                Text("Episode \(episode.episode)")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(episode.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(episode.air_date)
                    .font(.headline)
                
            }
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(.leading)
        }
        .frame(height: 150)
        .background(Color.gray.opacity(0.4))
        .background{
            RoundedRectangle(cornerRadius: 10)
                .stroke(LinearGradient(colors: colors ,
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing),lineWidth: 10)
        }
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    ContentView()
}
