//
//  DetailItemController.swift
//  FinalProject
//
//  Created by Farhan Permana on 02/05/23.
//

import UIKit
enum DetailSections: Int {
    case image = 0
    case description = 1
    case order = 2
}

class DetailItemController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var moveToDetailDelegate: PageTransitionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        
    }
    
    func setupTable() {
        tableView.register(ProductImgTableCell.self, forCellReuseIdentifier: ProductImgTableCell.identifier)
        tableView.register(UINib(nibName: DescTableCell.identifier, bundle: nil), forCellReuseIdentifier: DescTableCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension DetailItemController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DetailSections(rawValue: indexPath.section)
        switch section {
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductImgTableCell.identifier, for: indexPath) as? ProductImgTableCell else { return UITableViewCell() }
            cell.setupTable()
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescTableCell.identifier, for: indexPath) as? DescTableCell else { return UITableViewCell() }
            return cell
            //        case .order:
            //            let cell = tableView.dequeueReusableCell(withIdentifier: ProductOrderTableCell.identifier, for: indexPath) as! ProductOrderTableCell
            //            return cell
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            let section = DetailSections(rawValue: indexPath.section)
            switch section {
            case .image:
                return 300
            case .description:
                return 150
            case .order:
                return 300
            default:
                return 0
            }
        
    }
    
}
