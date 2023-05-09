//
//  ProductDetailImgCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 05/05/23.
//

import UIKit
import SDWebImage

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
//        productDetailImg.sd_setImage(with: URL(string: data?.images[0] ?? ""), completed: nil)
    productDetailImg.imageFromURL(urlString: data?.images[0] ?? "", size: CGSize(width: 50, height: 50) )
    }



}
