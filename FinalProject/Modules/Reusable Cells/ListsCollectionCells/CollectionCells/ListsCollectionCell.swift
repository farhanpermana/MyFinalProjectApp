//
//  ListsCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 13/04/23.
//

import UIKit
import SkeletonView
import Kingfisher

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
        productImg.showAnimatedGradientSkeleton()
        beforePrice.showAnimatedGradientSkeleton()
        afterPrice.showAnimatedGradientSkeleton()
        titleLabel.showAnimatedGradientSkeleton()
        descLabel.showAnimatedGradientSkeleton()
    }
    
    func hideSkeletonAnim() {
        productImg.hideSkeleton()
        beforePrice.hideSkeleton()
        afterPrice.hideSkeleton()
        titleLabel.hideSkeleton()
        descLabel.hideSkeleton()
    }
    


    func setupCell() {
        // bgview
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        
          // beforeprice strikethrough
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: beforePrice.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        beforePrice.attributedText = attributeString
        // title
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        afterPrice.font = UIFont.boldSystemFont(ofSize: 12)
        // description
        descLabel.textColor = UIColor.black
        descLabel.numberOfLines = 2
        
    }
    
    func configure(data: Product?) {
        afterPrice.textColor = UIColor.red
        // resize image for avoid high memory
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 250, height: 250))
        productImg.kf.setImage(with: URL(string: data?.thumbnail ?? ""),options: [.processor(processor)])
        
        titleLabel.text = data?.title
        beforePrice.text = "$\(data?.price ?? 0)"
        afterPrice.text = "$\(data?.discountPrice ?? 0)"
        descLabel.text = data?.description

    }
    
    func configureBrowse(data: Product?) {
        // resize image for avoid high memory
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 250, height: 250))
        productImg.kf.setImage(with: URL(string: data?.thumbnail ?? ""),options: [.processor(processor)])
        
        titleLabel.text = data?.title
        descLabel.text = data?.description
        
        if data?.price == data?.discountPrice {
            beforePrice.isHidden = true
            afterPrice.text = "$\(data?.price ?? 0)"
            afterPrice.textColor = UIColor.black
        } else {
            beforePrice.isHidden = true
            afterPrice.textColor = UIColor.black
            
            afterPrice.text = "$\(data?.discountPrice ?? 0)"
        }
    }

}
