//
//  CarouselCollectionCell.swift
//  FinalProject
//
//  Created by Farhan on 10/04/23.
//

import UIKit

class CarouselCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    static let identifier = "CarouselCollectionCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    func setupCell() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = true
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            
            UIColor(red: 1, green: 0.318, blue: 0.184, alpha: 1).cgColor,

            UIColor(red: 0.867, green: 0.141, blue: 0.463, alpha: 1).cgColor

          ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bgView.bounds
        bgView.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
