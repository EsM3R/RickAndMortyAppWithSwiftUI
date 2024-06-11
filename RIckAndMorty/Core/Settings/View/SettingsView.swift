//
//  SettingsView.swift
//  RIckAndMorty
//
//  Created by Mehmet Vural on 19.05.2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var viewModel = SettingsViewViewModel()
    
    var body: some View {
        NavigationStack{
         SettingsCellViews()
            .navigationTitle("Settings")
            .background(Color(uiColor: UIColor.systemBackground))
        }
    }
}
extension SettingsView {
    
    @ViewBuilder
    func SettingsCellViews() -> some View{
        List{
            ForEach(viewModel.settingCellsViewModel) {cellViewModel in
                SettingsCellView(cellViewModel: cellViewModel)
            }
        }
    }
}


struct SettingsCellView : View {
    
    let cellViewModel : SettingsCellViewModel
    
    var body: some View {
        HStack{
            Image(systemName: cellViewModel.systemImage)
                .font(.system(size: 25))
                .frame(width: 35 ,height: 35)
                .padding(8)
                .background(content: {
                    cellViewModel.backgroundColor
                })
            
    
            .clipShape(.rect(cornerRadius: 8))
            
            Text(cellViewModel.title)
                .font(.headline)
                .fontWeight(.black)
                .padding(.leading , 5)
            Spacer()
            
        }
        
    }
}



#Preview {
    SettingsView()
}
