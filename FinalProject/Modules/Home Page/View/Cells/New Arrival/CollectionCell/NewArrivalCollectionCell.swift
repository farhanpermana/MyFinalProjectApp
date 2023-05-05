//
//  NewArrivalCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 11/04/23.
//

import UIKit

class NewArrivalCollectionCell: UICollectionViewCell {
    
    static let identifier = "NewArrivalCollectionCell"

    @IBOutlet weak var productImg: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        // wrap text
        titleLabel.numberOfLines = 1
        subTitleLabel.numberOfLines = 2

    }
    
 

}
