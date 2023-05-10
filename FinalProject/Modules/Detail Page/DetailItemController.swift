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
}

class DetailItemController: UIViewController {
    
    static let identifier = "DetailItemController"
    
    @IBOutlet weak var detailTV: UITableView!
    @IBOutlet weak var addToCartButton: UIButton!
    
    
    weak var moveToDetailDelegate: PageTransitionDelegate?
    var detailDatas: ProductsModel?
    var detailDataArray: Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        
        print("Data loaded successfully!")
    }
    
    func setupTable() {
        detailTV.register(ProductImgTableCell.self, forCellReuseIdentifier: ProductImgTableCell.identifier)
        detailTV.register(UINib(nibName: DescTableCell.identifier, bundle: nil), forCellReuseIdentifier: DescTableCell.identifier)
        
        detailTV.delegate = self
        detailTV.dataSource = self
        
        detailTV.allowsSelection = false
        addToCartButton.tintColor = UIColor(rgb: 0x75001d)
    }
}

extension DetailItemController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DetailSections(rawValue: indexPath.section)
        switch section {
        case .image:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductImgTableCell.identifier, for: indexPath) as? ProductImgTableCell else { return UITableViewCell() }
            
            cell.productDetailImgDatas = detailDatas
            
            cell.setupTable()
            return cell
            
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescTableCell.identifier, for: indexPath) as? DescTableCell else { return UITableViewCell() }
            cell.setupDescTableCell()
            cell.configureProductDesc(data: detailDatas?.products[indexPath.row])
            return cell
            
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
            return 300
        default:
            return 0
        }
        
    }
    
}
