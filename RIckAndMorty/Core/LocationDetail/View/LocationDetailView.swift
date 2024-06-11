//
//  LocationDetailView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 11.06.2024.
//

import SwiftUI


struct LocationDetailView: View {
     
    private var viewModel : LocationDetailViewViewModel
    
    init(viewModel: LocationDetailViewViewModel) {
        self.viewModel = viewModel
    }
    private let columns =
    [GridItem](repeating: GridItem(.flexible(),spacing: 10),count: 2)
    
    var body: some View {
        
        ScrollView {
            LazyVStack{
                LocationDetailInfoCells()
                LocationCharacterListView()

            }
            .padding(.horizontal ,5 )
        }
        .navigationTitle("Location")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "square.and.arrow.up")
            }
        }
        
    }
}

extension LocationDetailView {
    
    @ViewBuilder
    func LocationDetailInfoCell(_ info : LocationDetailInfoCellViewModel ) -> some View {
        HStack{
            Text(info.type)
            Spacer()
            Text(info.value)
                .foregroundStyle(Color.gray)
                .fontWeight(.semibold)
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
    func LocationDetailInfoCells () -> some View {
        ForEach(viewModel.locationDetailInfos) { info in
            LocationDetailInfoCell(info)
        }
    }
    
    @ViewBuilder
    func LocationCharacterListView() -> some View {
        
        let columns =
        [GridItem](repeating: GridItem(.flexible(),spacing: 10),count: 2)
        
        ScrollView {
            LazyVGrid(columns: columns,
                      spacing: 10,
                      content: {
                ForEach(viewModel.allResidents ,id : \.self ) { urlString in
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

