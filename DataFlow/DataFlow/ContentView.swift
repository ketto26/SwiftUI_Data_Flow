//
//  ContentView.swift
//  DataFlow
//
//  Created by Keto Nioradze on 10.12.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = GroceryStoreViewModel()
    @State private var showCart = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.products) { product in
                    HStack {
                        Image(product.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text(product.name)
                        
                        Spacer()
                        
                        Text("$\(product.price, specifier: "%.2f")")
                        
                        Button(action: {
                            
                            viewModel.increaseQuantity(for: product)
                        }) {
                            
                            Image(systemName: "plus.circle")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        
                        Text("\(product.quantity)")
                        
                        Button(action: {
                            
                            viewModel.decreaseQuantity(for: product)
                        }) {
                            
                            Image(systemName: "minus.circle")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        
                        Button(action: {
                            
                            viewModel.deleteProduct(at: IndexSet([viewModel.products.firstIndex(of: product)!]))
                        }) {
                            
                            Image(systemName: "trash.circle")
                        }
                        .buttonStyle(BorderedButtonStyle())
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Grocery Store")
            .navigationBarItems(trailing:
                Button(action: {
                
                    showCart.toggle()
                }) {
                    
                    Image(systemName: "cart")
                }
            )
            .sheet(isPresented: $showCart) {
                
                CartView(viewModel: viewModel)
            }
        }
    }
}

// MARK: - CartView
struct CartView: View {
    @ObservedObject var viewModel: GroceryStoreViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.products) { product in
                    HStack {
                        
                        Text("\(product.name): \(product.quantity)")
                        
                        Spacer()
                        
                        Text("$\(product.price * Double(product.quantity), specifier: "%.2f")")
                    }
                }
                
                Text("Total: $\(viewModel.totalCost, specifier: "%.2f")")
            }
            .listStyle(InsetGroupedListStyle())
            
            Spacer()
        }
        .navigationTitle("Cart")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
