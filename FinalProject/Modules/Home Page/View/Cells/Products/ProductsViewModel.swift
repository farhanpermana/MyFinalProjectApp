//
//  ProductsViewModel.swift
//  FinalProject
//
//  Created by Farhan Permana on 05/05/23.
//

import Foundation

protocol ApiServiceProductsProtocol {
//    var urlString: String? { get set }
    var bindProductsData: ((ProductsModel?) -> ())? {get set}
    func fetchProducts()
}

class ProductsViewModel: ApiServiceProductsProtocol {
    
    private var apiService: ApiService?
//    var data: Product?
    private var urlString = "http://localhost:3003/products"
    var bindProductsData: ((ProductsModel?) -> Void)?
    
    init(apiService: ApiService?){
//        self.urlString = urlString
        self.apiService = apiService
//        if let url = URL(string: urlString ?? "") {
//            self.apiService?.get(url: url)
//        }
        fetchProducts()
    }
    
    func fetchProducts() {
        self.apiService?.callAPI(url: self.urlString, model: ProductsModel?.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindProductsData?(success)
                print("products sukses")
            case .failure(_):
                print("products gagal")
                self.bindProductsData?(nil)
            }
        })
    }
    
//    func numberOfRowsInSection() -> Int {
//
//    }
}
