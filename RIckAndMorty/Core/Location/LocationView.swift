//
//  LocationView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import SwiftUI

struct LocationView: View {
    
    @State private var viewModel = LocationViewModel()
    
    var body: some View {
        NavigationStack{
        
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.locations){location in
                        Group {
                            let viewModel = LocationCellViewModel(location: location)
                            NavigationLink(value: location) {
                                LocationCellView(viewModel: viewModel)
                            }
                          
                        }
                
                    }
                    Text("Bottom")
                        .onAppear{
                            print("ill show you")
                        }
                }
           
            }
            .navigationTitle("Locations")
            .navigationDestination(for: Location.self, destination: { location in
                let viewModel = LocationDetailViewViewModel(urlString: location.url)
                LocationDetailView(viewModel: viewModel)
            })
            .background(Color(uiColor: UIColor.systemBackground))
        }
    }
}

struct LocationCellView : View{

    var viewModel : LocationCellViewModel
    
    var body: some View{
        VStack(alignment : .leading){
            Text(viewModel.name)
                .font(.title3)
                .fontWeight(.bold)
            
            Group{
                Text(viewModel.type)
                Text(viewModel.dimension)
            }
            .font(.subheadline)
            .foregroundStyle(Color.gray)
            .fontWeight(.semibold)
           
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .padding(.vertical , 8)
    }
}
extension LocationView {
    
    
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
    func LocationCellsView() -> some View {
        ForEach(viewModel.locations){ location in
            
            NavigationLink(value: location.url) {
                LocationCellView(location)
            }
            .tint(Color.primary)
            
        }
    }
    
    @ViewBuilder
    func LocationCellView(_ location : Location) -> some View {
        
        
        let colors : [Color] = [.blue ,.purple ,.red ,.green,.orange,.pink,.yellow ,
                .mint]
        VStack(spacing : 20){
            Group{
                Text(location.)
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
    LocationView()
}
