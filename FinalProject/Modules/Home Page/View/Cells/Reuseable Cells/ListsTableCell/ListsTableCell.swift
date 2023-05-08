//
//  ListsTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit
import SDWebImage

class ListsTableCell: UITableViewCell {
    
    static let identifier = "ListsTableCell"
    
    @IBOutlet weak var imgLabel: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productType: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        
    }
    
    func configureSaleProducts(data: Product?) {
        imgLabel.sd_setImage(with: URL(string: data?.thumbnail ?? ""), completed: nil)
        productTitle.text = data?.title
        productType.text = data?.type
        category.text = data?.category
        price.text = "Rp. \(data?.price ?? 0)"
    }
    
}
