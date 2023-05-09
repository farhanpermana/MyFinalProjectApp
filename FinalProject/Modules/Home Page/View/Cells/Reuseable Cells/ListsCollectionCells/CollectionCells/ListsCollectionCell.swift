//
//  ListsCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit
import SDWebImage
import SkeletonView

class ListsCollectionCell: UICollectionViewCell {
    
    static let identifier = "ListsCollectionCell"

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var beforePrice: UILabel!
    
    @IBOutlet weak var afterPrice: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupCell() {
        // bgview
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        
          // beforeprice strikethrough
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: beforePrice.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        beforePrice.attributedText = attributeString
        // afterprice red
        afterPrice.textColor = UIColor.red
        // title
        titleLabel.textColor = UIColor.black
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        // description
        descLabel.textColor = UIColor.black
        descLabel.numberOfLines = 2
        
        
    }
    
    func configure(data: Product?) {
        
        productImg.imageFromURL(urlString: data?.thumbnail ?? "", size: CGSize(width: 160, height: 210))
        
        titleLabel.text = data?.title
        beforePrice.text = "$\(data?.price ?? 0)"
        afterPrice.text = "$\(data?.discountPrice ?? 0)"
        descLabel.text = data?.description

    }

}
