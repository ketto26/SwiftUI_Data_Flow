//
//  StoreViewModel.swift
//  DataFlow
//
//  Created by Keto Nioradze on 11.12.23.
//

import Foundation

class GroceryStoreViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "Apple", price: 1.0, quantity: 0, imageName: "apple"),
        Product(name: "Banana", price: 0.5, quantity: 0, imageName: "banana"),
        Product(name: "Mango", price: 0.5, quantity: 0, imageName: "mango"),
        Product(name: "Pineapple", price: 0.5, quantity: 0, imageName: "pineapple"),
        Product(name: "Broccoli", price: 1.0, quantity: 0, imageName: "broccoli"),
        Product(name: "Garlic", price: 0.5, quantity: 0, imageName: "garlic"),
    ]
    
    func increaseQuantity(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products[index].quantity += 1
        }
    }
    
    func decreaseQuantity(for product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            if products[index].quantity > 0 {
                products[index].quantity -= 1
            }
        }
    }
    
    func deleteProduct(at indexSet: IndexSet) {
        products.remove(atOffsets: indexSet)
    }
    
    var totalCost: Double {
        var total: Double = 0
        for product in products {
            total += Double(product.quantity) * product.price
        }
        return total
    }
}
