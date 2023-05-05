//
//  StoreModels.swift
//  FinalProject
//
//  Created by Farhan Permana on 16/04/23.
//

import Foundation

struct StoreModel: Codable {
    let title: String
    let carousel: Carousel
    let category: WelcomeCategory
    let product: Product
}

// MARK: - WelcomeCarousel
struct Carousel: Codable {
    let carouselID: Int
    let carousels: [CarouselElement]

    enum CodingKeys: String, CodingKey {
        case carouselID = "carouselId"
        case carousels
    }
}

// MARK: - CarouselElement
struct CarouselElement: Codable {
    let bannerID: Int
    let banner: String

    enum CodingKeys: String, CodingKey {
        case bannerID = "bannerId"
        case banner
    }
}

// MARK: - WelcomeCategory
struct WelcomeCategory: Codable {
    let categoryID: Int
    let categories: [CategoryElement]

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case categories
    }
}

// MARK: - CategoryElement
struct CategoryElement: Codable {
    let catID: Int
    let name: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case catID = "catId"
        case name, icon
    }
}

// MARK: - WelcomeProduct
struct Product: Codable {
    let products: [ProductElement]
}

// MARK: - ProductElement
struct ProductElement: Codable {
    let id: Int
    let title: String
    let price, discountPrice: Double
    let description: String
    let type: TypeEnum
    let category: String
    let image1, image2, image3: String
    let rating: Rating
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

enum TypeEnum: String, Codable {
    case men = "men"
    case unisex = "unisex"
    case women = "women"
}
