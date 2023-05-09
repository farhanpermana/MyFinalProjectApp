//
//  DescTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 03/05/23.
//

import UIKit

class DescTableCell: UITableViewCell {
    
    static let identifier = "DescTableCell"

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupDescTableCell() {
        // price
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
    }
    
    func configureProductDesc(data: Product?) {
        productNameLabel.text = data?.title ?? "error null"
        productDescLabel.text = data?.description
        categoryLabel.text = data?.category
        typeLabel.text = data?.type
        priceLabel.text = "$\(data?.price ?? 0)"
    }
    

    
}
