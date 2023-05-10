//
//  CatCollectionCell.swift
//  FinalProject
//
//  Created by Farhan Permana on 11/04/23.
//

import UIKit
import Kingfisher

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
        
        bgView.layer.masksToBounds = false
        catTitle.font = catTitle.font.withSize(11)
        
        catTitle.text = catTitle.text?.capitalized
    
    
    }
    func configureCell(data: CategoryElement?) {
        catTitle.text = data?.name
        // reduce image for avoid high memory
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 100, height: 100))
        catImg.kf.setImage(with: URL(string: data?.icon ?? ""),options: [.processor(processor)])
        
    
    }

}
