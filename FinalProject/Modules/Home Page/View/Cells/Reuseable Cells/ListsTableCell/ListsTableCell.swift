//
//  ListsTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit

class ListsTableCell: UITableViewCell {
    
    static let identifier = "ListsTableCell"

    @IBOutlet weak var numberLabel: UILabel!
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
