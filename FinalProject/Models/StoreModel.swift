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
    let category: ProductCategory
    
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
struct ProductCategory: Codable {
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
