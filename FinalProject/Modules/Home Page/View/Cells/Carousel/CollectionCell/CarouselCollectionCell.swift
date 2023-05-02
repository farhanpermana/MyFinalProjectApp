//
//  CarouselCollectionCell.swift
//  FinalProject
//
//  Created by Farhan on 10/04/23.
//

import UIKit
import SDWebImage

class CarouselCollectionCell: UICollectionViewCell {
    

    @IBOutlet weak var imgView: UIImageView!
    
    static let identifier = "CarouselCollectionCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell() {
        imgView.layer.cornerRadius = 4
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = true
        // img height
        
    }
    
    func configureCarouselCell(data: Carousel?) {
//        imgView.image = UIImage(named: data?.carousels[0].banner ?? "banner")
        imgView.sd_setImage(with: URL(string: data?.carousels[0].banner ?? "banner"), placeholderImage: UIImage(named: "banner"))
    
    
    }
    
    

}
