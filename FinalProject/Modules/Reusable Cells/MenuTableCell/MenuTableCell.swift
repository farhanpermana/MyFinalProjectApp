//
//  MenuTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 17/04/23.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    static let identifier = "MenuTableCell"

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        iconLabel.tintColor = UIColor(rgb: 0x75001d)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
