//
//  AppetizersListView.swift
//  Appetizers
//
//  Created by A.Hazzaa on 15/01/2024.
//

import SwiftUI

struct AppetizersListView: View {
    
    @StateObject var viewModel = AppetizersListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView{
                List(viewModel.appetizers) { appetizer in
                    AppetizersListCell(appetizer: appetizer)
                }
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizersListView()
}
