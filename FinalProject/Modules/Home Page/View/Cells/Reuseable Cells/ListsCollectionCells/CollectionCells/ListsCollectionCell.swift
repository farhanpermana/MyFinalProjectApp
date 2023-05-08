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
        // description
        descLabel.textColor = UIColor.black
        
        
    }
    
    func configure(data: Product?) {
        productImg.sd_setImage(with: URL(string: data?.thumbnail ?? ""), completed: nil)
        
        titleLabel.text = data?.title
        beforePrice.text = "Rp. \(data?.price ?? 0)"
        afterPrice.text = "Rp. \(data?.discountPrice ?? 0)"
        descLabel.text = data?.description

    }

}
