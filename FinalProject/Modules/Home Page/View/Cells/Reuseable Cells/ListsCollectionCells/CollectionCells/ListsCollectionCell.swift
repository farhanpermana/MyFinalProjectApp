//
//  ListsCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit
import SDWebImage

class ListsCollectionCell: UICollectionViewCell {
    
    static let identifier = "ListsCollectionCell"

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var beforePrice: UILabel!
    
    @IBOutlet weak var afterPrice: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupCell() {
        // afterprice red
        afterPrice.textColor = UIColor.red
        // title
        titleLabel.textColor = UIColor.black
    }
    
    func configure(data: ProductElement?) {
        productImg.sd_setImage(with: URL(string: data?.image1 ?? ""), completed: nil)
        
        titleLabel.text = data?.title
        beforePrice.text = "\(data?.price ?? 0)"
        afterPrice.text = "\(data?.discountPrice ?? 0)"
        descLabel.text = data?.description


//        beforePrice.text = "\(data?.products[0].price ?? 0)"
//        afterPrice.text = "\(data?.products[0].discountPrice ?? 0)"
//        descLabel.text = data?.products[0].description


    }

}
