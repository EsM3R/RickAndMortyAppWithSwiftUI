//
//  CharacterView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import SwiftUI

struct CharacterView: View {
    
    @State private var viewModel = CharacterViewModel()
   
    var body: some View {
        NavigationStack{
            
            VStack{
                
                if viewModel.characters.isEmpty {
                    ProgressView()
                }else {
                    CharacterListView()
                        
                }
            }
            .padding(.horizontal ,5)
            .navigationTitle("Characters")
            .background(Color(uiColor: UIColor.secondarySystemBackground))
            .navigationDestination(for: String.self) { urlString in
                CharacterDetailScreen(urlString: urlString)
            }
            .task {
                await viewModel.fetchAllCharacters()
            }
        }
    }
}
extension CharacterView{
    
    @ViewBuilder
    func CharacterListView() -> some View {
        
        let columns =
        [GridItem](repeating: GridItem(.flexible(),spacing: 10),count: 2)
        
        ScrollView {
            LazyVGrid(columns: columns,
                      spacing: 10,
                      content: {
                ForEach(viewModel.characters ) { character in
                    NavigationLink(value: character.url) {
                        CharacterCellView(viewModel: CharacterCellViewModel(urlString: character.url))
                    }
                    .tint(.primary)
                    
                }
                ProgressView()
                    .frame(maxWidth: .infinity , alignment: .center )
                    .onAppear{
                        Task {
                            try? await Task.sleep(nanoseconds:1_500_000_000)
                            await viewModel.fetchMoreCharacters()
                        }
                        
                    }
            })
            
        }
    }

}

struct CharacterCellView : View {
    
    @State var viewModel : CharacterCellViewModel
    var body: some View {
        VStack {
            if let uiImage = viewModel.image{
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(0.75, contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 5))
                    
            }
            Group{
                Text(viewModel.name)
                    .font(.title2)
                    .fontWeight(.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.4)
                
                Text(viewModel.status)
                    .font(.headline)
                    .fontWeight(.semibold)
                    
            }
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(.leading,5)
        }
    }
}

#Preview {
    ContentView()
}





