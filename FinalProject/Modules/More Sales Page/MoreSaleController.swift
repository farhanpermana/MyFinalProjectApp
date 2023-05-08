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
    var moreSaleViewModel: ProductsViewModel?
    var dataProducts: Product?
    
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
//        let count = saleProductDatas?.products.count ?? 0
            let countProduct = saleProductDatas?.products.filter({ $0.price != $0.discountPrice }) ?? []
        print("sale all count", countProduct)
        return countProduct.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListsTableCell.identifier, for: indexPath) as? ListsTableCell else { return UITableViewCell() }
        
        cell.configureSaleProducts(data: saleProductDatas?.products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            }
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let detailVC = storyboard.instantiateViewController(withIdentifier: DetailItemController.identifier) as! DetailItemController
//
//        detailVC.detailDataArray = saleProductDatas?.products[indexPath.row]
//        self.navigationController?.pushViewController(detailVC, animated: true)
//    }
    
}
