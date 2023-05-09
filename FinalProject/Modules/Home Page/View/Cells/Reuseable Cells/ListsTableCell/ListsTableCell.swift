//
//  ListsTableCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit
import SDWebImage
import SkeletonView

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
        
    }
    
    func configureSaleProducts(data: Product?) {
        bgView.showSkeleton()
//        imgLabel.sd_setImage(with: URL(string: data?.thumbnail ?? ""), completed: nil)
        imgLabel.imageFromURL(urlString: data?.thumbnail ?? "", size: CGSize(width: 50, height: 50) )
        productTitle.text = data?.title
        productType.text = data?.type
        category.text = data?.category
        price.text = "$\(data?.price ?? 0)"
            bgView.hideSkeleton()
    }
    
}
