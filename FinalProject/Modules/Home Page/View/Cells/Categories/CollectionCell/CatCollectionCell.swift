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
        setupCell()
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
    
    }
    func configureCell(data: CategoryElement?) {
        catTitle.text = data?.name
        catImg.sd_setImage(with: URL(string: data?.icon ?? "cat"), placeholderImage: UIImage(named: "cat"))

//        catImg.image = UIImage(named: data?.image ?? "cat")
        
    }

}
