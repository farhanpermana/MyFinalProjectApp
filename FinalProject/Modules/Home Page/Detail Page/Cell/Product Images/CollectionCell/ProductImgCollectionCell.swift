//
//  ProductImgCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 02/05/23.
//

import UIKit

class ProductImgCollectionCell: UICollectionViewCell {
    
    static let identifier = "ProductImgCollectionCell"

    @IBOutlet weak var imgLabel: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
