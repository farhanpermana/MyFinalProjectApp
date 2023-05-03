//
//  HomeViewModel.swift
//  FinalProject
//
//  Created by Farhan on 06/04/23.
//

import Foundation

protocol ApiServiceStoreProtocol {
    var urlString: String? { get set }
    var bindListData: ((StoreModel?) -> ())? {get set}
    func fetchItem()
}

class HomeViewModel: ApiServiceStoreProtocol {
    
    private var apiService: ApiService?
    var data: StoreModel?
    var urlString: String?
    var bindListData: ((StoreModel?) -> Void)?
    init(urlString: String?, apiService: ApiService?){
        self.urlString = urlString
        self.apiService = apiService
        if let url = URL(string: urlString ?? "") {
            self.apiService?.get(url: url)
        }
        fetchItem()
    }
    
    func fetchItem() {
        self.apiService?.callAPI(model: StoreModel?.self, completion: { response in
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
    
//    func numberOfRowsInSection() -> Int {
//
//    }
}
