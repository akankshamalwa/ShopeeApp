//
//  ProductViewModel.swift
//  ShopeeApp
//
//  Created by Akanksha Dipak Bothe on 15/04/25.
//

import Foundation
import Alamofire
import Combine

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchProducts() {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(ProductResponse.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.products = decodedData.products
                    print("** \(String(describing: self?.products))")
                }
            } catch {
                print("Error occured while fetching data!")
            }
        }.resume()
    }
}
