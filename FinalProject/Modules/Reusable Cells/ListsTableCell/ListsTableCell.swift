//
//  ListsTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit
import SkeletonView
import Kingfisher

class ListsTableCell: UITableViewCell {
    
    static let identifier = "ListsTableCell"
    
    @IBOutlet weak var imgLabel: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productType: UILabel!
    
    @IBOutlet weak var category: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        imgLabel.isSkeletonable = true
    }
    
    func setupCell() {
        // bold
        productTitle.font = productTitle.font.withSize(12)
        
    }
    
    func configureSaleProducts(data: Product?) {
//        bgView.showSkeleton()
//        imgLabel.imageFromURL(urlString: data?.thumbnail ?? "", size: CGSize(width: 50, height: 60) )
//        imgLabel.sd_setImage(with: URL(string: data?.thumbnail ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        imgLabel.kf.setImage(with: URL(string: data?.thumbnail ?? ""))
        productTitle.text = data?.title
        productType.text = data?.type
        category.text = data?.category
        price.text = "$\(data?.discountPrice ?? 0)"
//        bgView.hideSkeleton()
    }
    
}
