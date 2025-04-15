//
//  ContentView.swift
//  ShopeeApp
//
//  Created by Akanksha Dipak Bothe on 15/04/25.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                } else {
                    List(viewModel.products, id: \.id) { product in
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Products")
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}

#Preview {
    ContentView()
}
