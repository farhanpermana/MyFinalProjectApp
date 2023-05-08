//
//  ProductsModel.swift
//  FinalProject
//
//  Created by Farhan Permana on 05/05/23.
//

import Foundation

struct ProductsModel: Codable {
    var products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title: String
    let price, discountPrice: Double
    let description: String
    let type: String
    let category: String
    let thumbnail: String
    let images: [String]
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}


//enum TypeEnum: String, Codable {
//    case men = "men"
//    case unisex = "unisex"
//    case women = "women"
//}
