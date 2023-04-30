//
//  MoreSaleController.swift
//  FinalProject
//
//  Created by Farhan Permana on 15/04/23.
//

import UIKit

class MoreSaleController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTable()
    }
    
    func registerTable() {
        tableView.register(UINib(nibName: ListsTableCell.identifier, bundle: nil), forCellReuseIdentifier: ListsTableCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    }

}

extension MoreSaleController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListsTableCell.identifier, for: indexPath) as? ListsTableCell else { return UITableViewCell() }
        
        return cell
    }
    
}
