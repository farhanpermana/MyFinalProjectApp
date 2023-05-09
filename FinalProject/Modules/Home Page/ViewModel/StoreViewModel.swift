//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by Farhan on 06/04/23.
//

import Foundation

protocol ApiServiceStoreProtocol {
    var bindListData: ((StoreModel?) -> ())? {get set}
    func fetchItem()
}

class StoreViewModel: ApiServiceStoreProtocol {
    
    private var apiService: ApiService?
    private var urlString = "http://localhost:3003/store"
    
    var bindListData: ((StoreModel?) -> Void)?
    init(apiService: ApiService?){
        self.apiService = apiService
        fetchItem()
    }
    
    func fetchItem() {
        self.apiService?.callAPI(url: urlString, model: StoreModel?.self, completion: { response in
            switch response {
            case .success(let success):
                self.bindListData?(success)
                print("sukses")
            case .failure(_):
                print("gagal")
                self.bindListData?(nil)
            }
        })
    }
}
