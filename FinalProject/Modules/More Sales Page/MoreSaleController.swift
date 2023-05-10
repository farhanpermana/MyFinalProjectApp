//
//  MoreSaleController.swift
//  FinalProject
//
//  Created by Farhan Permana on 15/04/23.
//

import UIKit

class MoreSaleController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var saleProductDatas: ProductsModel?
    private var moreSaleViewModel: ProductsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTable()
        
    }
    
    func registerTable() {
        tableView.register(UINib(nibName: ListsTableCell.identifier, bundle: nil), forCellReuseIdentifier: ListsTableCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        setupApi()
    }
    
    fileprivate func setupApi() {
        self.moreSaleViewModel = ProductsViewModel(apiService: ApiService())
        self.moreSaleViewModel?.bindProductsData = {
            listModel in
            if let listData = listModel {
                self.saleProductDatas = listData
                print("bound more sale products")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension MoreSaleController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //MARK: - filtering sale section
        let countProduct = saleProductDatas?.products.filter({ $0.price != $0.discountPrice }) ?? []
        print("more sale all count", countProduct)
        return countProduct.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListsTableCell.identifier, for: indexPath) as? ListsTableCell else { return UITableViewCell() }
        //MARK: - filtering sale section
        if let productDataItem = saleProductDatas?.products.filter({ $0.price != $0.discountPrice })[indexPath.row] {
            cell.configureSaleProducts(data: productDataItem)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
