//
//  BrowseAllController.swift
//  FinalProject
//
//  Created by Farhan Permana on 10/05/23.
//

import UIKit

class BrowseAllController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var browseProductDatas: ProductsModel?
    
    var browseProductViewModel: ProductsViewModel?

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
        self.browseProductViewModel = ProductsViewModel(apiService: ApiService())
        self.browseProductViewModel?.bindProductsData = {
            listModel in
            if let listData = listModel {
                self.browseProductDatas = listData
                print("bound more sale products")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension BrowseAllController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countProduct = browseProductDatas?.products.count
        print("browse all count", countProduct ?? 0)
        return countProduct ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let browseDatas = browseProductDatas?.products[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: ListsTableCell.identifier, for: indexPath) as? ListsTableCell else { return UITableViewCell() }
       
            cell.configureSaleProducts(data: browseDatas)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

