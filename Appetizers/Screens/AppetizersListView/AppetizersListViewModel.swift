//
//  AppetizersListViewModel.swift
//  Appetizers
//
//  Created by A.Hazzaa on 18/01/2024.
//

import Foundation
import SwiftUI

final class AppetizersListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                
                isLoading = false
                
                switch result {
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    
                    switch error {
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        break
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        break
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        break
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                        break
                        
                    }
                    break
                }
            }
            
        }
    }
    
}
