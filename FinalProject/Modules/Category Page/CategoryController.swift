//
//  CategoryController.swift
//  FinalProject
//
//  Created by Farhan Permana on 03/05/23.
//

import UIKit

class CategoryController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var storeDatas: StoreModel?
    var selectedCategory: String?
//    var selectedCategory: CategoryElement?
//    var filteredProducts: [Product]?
    var productArray: Product?
    var productDatas: ProductsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
    }
    func registerTable() {
        tableView.register(CategoryTableCell.self, forCellReuseIdentifier: SaleCollectionTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupCategoryFilter() {
        
    }
}

extension CategoryController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableCell.identifier, for: indexPath) as? CategoryTableCell else { return UITableViewCell() }
        
        cell.setupTable()
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height
    
    }
}
