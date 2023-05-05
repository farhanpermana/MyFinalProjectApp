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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
    }
    func registerTable() {
        tableView.register(SaleCollectionTableCell.self, forCellReuseIdentifier: SaleCollectionTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CategoryController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let items = storeDatas?.brands[indexPath.row],
         guard let cell = tableView.dequeueReusableCell(withIdentifier: SaleCollectionTableCell.identifier, for: indexPath) as? SaleCollectionTableCell else { return UITableViewCell() }
        
        // handle storeDatas.brand[indexPath.row].products.category
//        cell.setupTable()
//        cell.setupTable()
        
        
//        print("count cat", storeDatas?.brands[indexPath.row].products.count ?? 0)
                
        return cell

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height
    
    }
}
