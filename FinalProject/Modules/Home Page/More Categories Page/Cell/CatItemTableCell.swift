//
//  CatItemTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 02/05/23.
//

import UIKit

class CatItemTableCell: UITableViewCell {
    
    static let identifier = "CatItemTableCell"

    @IBOutlet weak var catLabel: UILabel!
    
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
