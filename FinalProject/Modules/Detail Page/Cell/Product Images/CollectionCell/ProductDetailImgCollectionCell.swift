//
//  ProductDetailImgCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 05/05/23.
//

import UIKit
import Kingfisher

class ProductDetailImgCollectionCell: UICollectionViewCell {
    
    static let identifier = "ProductDetailImgCollectionCell"
    
    @IBOutlet weak var productDetailImg: UIImageView!
    
    @IBOutlet weak var productDetailImgBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupProductDetailImgCollectionCell() {
        productDetailImgBgView.layer.cornerRadius = 1
        
    }
    
    func configureProductDetail(data: Product?) {

        productDetailImg.kf.setImage(with: URL(string: data?.images[0] ?? ""))
        
    }
}
