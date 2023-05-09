//
//  CategoryViewModel.swift
//  FinalProject
//
//  Created by Farhan Permana on 08/05/23.
//

import Foundation

protocol CategoryViewModelProtocol {
    var ProductPerCategoryDataBinding: ((ProductsModel?) -> ())? { get set }
}

class CategoryViewModel: CategoryViewModelProtocol {
    private var apiServiceProtocol: ApiServiceProtocol
    
    var ProductPerCategoryDataBinding: ((ProductsModel?) -> ())?
    
    var category: String?
    
    private var url: String {
        guard let category = category else { return "" }
        let urlString = "http://localhost:3003/category/\(category)"
        return urlString
    }
    
    init(category: String, apiServiceProtocol: ApiServiceProtocol) {
        self.category = category
        self.apiServiceProtocol = apiServiceProtocol
        fetchDataAllProducts()
    }
    
    func fetchDataAllProducts() {
        self.apiServiceProtocol.callAPI(url: self.url, model: ProductsModel.self, completion: {response in
            switch response {
            case .success(let product):
                self.ProductPerCategoryDataBinding?(product)
            case .failure(let error):
                print(error.localizedDescription)
                self.ProductPerCategoryDataBinding?(nil)
            }
        })
        
    }
}
