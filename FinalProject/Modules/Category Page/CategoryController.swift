//
//  CategoryController.swift
//  FinalProject
//
//  Created by Farhan Permana on 03/05/23.
//

import UIKit
import SkeletonView

class CategoryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    var selectedCategory: String?
    
    var productDatas: ProductsModel?
    
    var categoryViewModel: CategoryViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
        categoryTitle.text = selectedCategory?.capitalized ?? ""
    }
    func registerTable() {
        tableView.register(UINib(nibName: ListsTableCell.identifier, bundle: nil), forCellReuseIdentifier: ListsTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupApi()
    }
    
    fileprivate func setupApi() {
        self.categoryViewModel = CategoryViewModel(category: selectedCategory ?? "" ,apiServiceProtocol: ApiService())
        self.categoryViewModel?.ProductPerCategoryDataBinding = {
            listModel in
            if let listData = listModel {
                self.productDatas = listData
                print("bound products")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension CategoryController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        let countProduct = productDatas?.products
        print("category count", countProduct ?? 0)
        return countProduct?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let product = productDatas?.products[indexPath.section],
              let cell = tableView.dequeueReusableCell(withIdentifier: ListsTableCell.identifier, for: indexPath) as? ListsTableCell else { return UITableViewCell() }
        
        cell.configureSaleProducts(data: product)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
}
