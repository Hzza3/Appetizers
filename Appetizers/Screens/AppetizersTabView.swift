//
//  ContentView.swift
//  Appetizers
//
//  Created by A.Hazzaa on 15/01/2024.
//

import SwiftUI

struct AppetizersTabView: View {
    var body: some View {
        TabView {
            AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("House")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }.symbolVariant(.none)
        }
        .accentColor(Color(.brandPrimary))
    }
}

#Preview {
    AppetizersTabView()
}
