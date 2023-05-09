//
//  CatCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 11/04/23.
//

import UIKit

class CatCollectionCell: UICollectionViewCell {
    
    static let identifier = "CatCollectionCell"
    
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bgImgView: UIView!
    @IBOutlet weak var catImg: UIImageView!
    @IBOutlet weak var catTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell() {
        bgView.layer.cornerRadius = 8
        bgImgView.layer.cornerRadius = 20
        catImg.layer.cornerRadius = 20
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        bgView.layer.shadowOpacity = 0.2
        bgView.layer.shadowRadius = 4
        bgView.layer.masksToBounds = false
        catTitle.font = catTitle.font.withSize(12)
    
    }
    func configureCell(data: CategoryElement?) {
        catTitle.text = data?.name
        catImg.imageFromURL(urlString: data?.icon ?? "", size: CGSize(width: 50, height: 50))
    }

}
