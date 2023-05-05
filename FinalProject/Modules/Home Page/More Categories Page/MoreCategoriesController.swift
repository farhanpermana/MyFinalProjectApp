//
//  MoreCategoriesController.swift
//  FinalProject
//
//  Created by Farhan Permana on 02/05/23.
//

import UIKit

class MoreCategoriesController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTable()
    }
    
    func registerTable() {
        tableView.register(UINib(nibName: CatItemTableCell.identifier, bundle: nil), forCellReuseIdentifier: CatItemTableCell.identifier)
        
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension MoreCategoriesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CatItemTableCell.identifier, for: indexPath) as? CatItemTableCell else { return UITableViewCell() }
            
            return cell
        
    }
}
