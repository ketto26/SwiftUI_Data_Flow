//
//  StoreModel.swift
//  DataFlow
//
//  Created by Keto Nioradze on 11.12.23.
//

import Foundation

struct Product: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let price: Double
    var quantity: Int
    let imageName: String 
}

